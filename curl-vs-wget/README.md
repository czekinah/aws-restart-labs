# curl and wget, and when each is the right call

![same_bytes](https://img.shields.io/badge/checksums-identical-2E8B2E?style=flat-square) ![curl_404](https://img.shields.io/badge/curl_on_404-exit_0-C0392B?style=flat-square) ![wget_404](https://img.shields.io/badge/wget_on_404-exit_8-43B02A?style=flat-square)

Both fetch a file over HTTP. They fail differently, and that is what decides which one belongs in a script.

Transcript: [`session.txt`](session.txt)

## The decision that mattered

By default `curl` treats a 404 as a successful transfer of an error page. It exits 0, and the script downstream carries on with a file full of HTML. `--fail` makes it exit 22 instead.

```
$ curl --fail --silent --show-error https://pypi.org/no-such-file.tar.gz
curl: (22) The requested URL returned error: 404
curl exit code: 22

$ wget -q https://pypi.org/no-such-file.tar.gz
wget exit code: 8
```

`wget` exits non-zero on a server error without being asked. So in a script `curl` needs `--fail` to be safe and `wget` is safe by default. That flag is the difference between a pipeline that stops and one that quietly processes garbage.

Both tools produced byte-identical files, confirmed with `sha256sum`. The choice is never about the download itself.

## What broke

`wget -c URL -O file` does not resume. `-O` forces all output into one file, which defeats the continuation logic, so a truncated 30 KB file restarted from zero:

```
'partial.tar.gz' saved [110794/110794]
```

Resume works with `wget -c URL` and the default filename.

<details>
<summary><b>You: why is the URL not the AWS CLI installer</b></summary>

<br>

The lab downloads `awscli-exe-linux-x86_64.zip`. The host I ran this on sits behind an egress policy that returns 403 to the CONNECT tunnel:

```
curl: (56) CONNECT tunnel failed, response 403
```

A policy denial, not a network fault, so there is nothing to retry. I ran the same comparison against a reachable archive. Every point holds. Only the URL changed.

</details>
