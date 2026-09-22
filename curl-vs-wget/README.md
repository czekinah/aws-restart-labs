# curl and wget, and when each one is the right call

Both fetch a file over HTTP. They fail differently, and that is the part that
decides which one belongs in a script.

## What I did

Downloaded the same archive with each tool, compared checksums, tested how each
reports an HTTP error, and tried to resume a truncated file. Full transcript in
[`session.txt`](session.txt).

## The decision that mattered

By default, `curl` treats a 404 as a successful transfer of an error page. It
exits zero, and a script built on it carries on with a file full of HTML. Adding
`--fail` makes it exit 22 instead:

```
curl --fail --silent --show-error https://pypi.org/no-such-file.tar.gz
curl: (22) The requested URL returned error: 404
curl exit code: 22
```

`wget` exits 8 on a server error without being asked. So in a script, `curl`
needs `--fail` to be safe, and `wget` is safe by default. That single flag is the
difference between a pipeline that stops and one that quietly processes garbage.

Both tools produced byte-identical files, confirmed by `sha256sum`, so the choice
is never about the download itself.

## What broke

Two things.

The lab downloads the AWS CLI installer from `awscli.amazonaws.com`. The host I
ran this on sits behind an egress policy that returns `403` to the CONNECT
tunnel, so the transfer never started:

```
curl: (56) CONNECT tunnel failed, response 403
```

That is a policy denial, not a network fault, so there is nothing to retry. I ran
the same comparison against a reachable archive instead. Every teaching point
holds; only the URL changed.

The second one is a real trap. `wget -c URL -O file` does not resume. `-O` forces
all output into one file, which defeats the continuation logic, so the transfer
restarted from zero and the log showed the full `110794/110794` rather than the
remaining bytes. Resume works with `wget -c URL` and the default filename.
