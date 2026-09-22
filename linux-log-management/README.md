# Log growth, scheduling and retention

An application log is a file that only ever gets bigger. This works out what it
costs, automates the writing, and puts a retention policy in front of it.

## What I did

Generated entries, measured the file four different ways, projected a year of
growth from a real average, scheduled the generator with cron, and forced a
logrotate cycle to watch what happens to the active file. Full transcript in
[`session.txt`](session.txt).

## The numbers

52 entries, 3047 bytes, so 58.60 bytes per entry. One entry every five minutes is
288 a day:

| Horizon | Estimated size |
|---|---|
| 1 day | 16.48 KiB |
| 30 days | 494.38 KiB |
| 365 days | 5.87 MiB |

Small, until you multiply it by every instance in a fleet and keep it forever.

## The decision that mattered

`ls -l` and `wc -c` both reported 114 bytes while `du -h` reported 4.0K for the
same file. They are not disagreeing. The first two report logical size, the bytes
the file contains; `du` reports allocated size, and the filesystem hands out whole
blocks. For capacity planning on thousands of small files, the allocated number is
the one that fills the disk.

## What broke

After `logrotate -f`, the directory held `app.log.1.gz` and no `app.log` at all:

```
$ logrotate -f -s /tmp/logrotate.state /tmp/app-log.conf && ls -l $HOME/log-demo/
-rw-r--r-- 1 root root 229 app.log.1.gz

$ ls $HOME/log-demo/app.log
ls: cannot access '~/log-demo/app.log': No such file or directory
```

The shipped config has no `create` directive, so logrotate renames the file and
leaves nothing behind. A long-running process holding that file open would keep
writing to the renamed inode and the new log would never appear. Adding `create`
or `copytruncate` is what prevents that, and which one you pick depends on whether
the application can be signalled to reopen its log.

Second, smaller thing: the shipped `logrotate/app-log.conf` hardcodes
`/home/ec2-user/log-demo/app.log`. It silently matches nothing on any host with a
different home directory, so I rewrote the path before running it.
