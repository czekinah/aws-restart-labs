# Log growth, scheduling and retention

![interval](https://img.shields.io/badge/interval-5_min-0F3D1F?style=flat-square) ![per_entry](https://img.shields.io/badge/per_entry-58.6_bytes-43B02A?style=flat-square) ![retention](https://img.shields.io/badge/rotate-7_days-F26B1D?style=flat-square)

An application log only ever gets bigger. This works out what that costs, automates the writing, and puts a retention policy in front of it.

Transcript: [`session.txt`](session.txt)

## The numbers

52 entries, 3047 bytes, so 58.60 bytes each. One entry every five minutes is 288 a day.

| Horizon | Estimated size |
|---|---|
| 1 day | 16.48 KiB |
| 30 days | 494.38 KiB |
| 365 days | 5.87 MiB |

Small, until you multiply it by a fleet and keep it forever.

## The decision that mattered

`ls -l` and `wc -c` both reported 114 bytes. `du -h` reported 4.0K for the same file.

They are not disagreeing. The first two report logical size, the bytes in the file. `du` reports allocated size, and the filesystem hands out whole blocks. For capacity planning across thousands of small files, the allocated number is the one that fills the disk.

## What broke

After a forced rotation the directory held `app.log.1.gz` and no `app.log` at all.

```
$ logrotate -f -s /tmp/logrotate.state /tmp/app-log.conf && ls -l $HOME/log-demo/
-rw-r--r-- 1 229 app.log.1.gz

$ ls $HOME/log-demo/app.log
ls: cannot access '~/log-demo/app.log': No such file or directory
```

The config has no `create` directive, so logrotate renames the file and leaves nothing behind. A long-running process holding that file open keeps writing to the renamed inode and the new log never appears.

> [!WARNING]
> Add `create` or `copytruncate`. Which one depends on whether the application can be signalled to reopen its log.

<details>
<summary><b>You: the smaller one</b></summary>

<br>

The shipped `logrotate/app-log.conf` hardcodes `/home/ec2-user/log-demo/app.log`. On any host with a different home directory it matches nothing and fails silently. I rewrote the path before running it.

</details>
