# Bash scripts that fail loudly

![exit_codes](https://img.shields.io/badge/exit_codes-5_distinct-0F3D1F?style=flat-square) ![strict_mode](https://img.shields.io/badge/set--euo-pipefail-43B02A?style=flat-square) ![gotchas](https://img.shields.io/badge/gotchas_found-2-F26B1D?style=flat-square)

A script that keeps going after a failed command is worse than one that crashes. Two scripts here, written to prove where bash stops and where it quietly does not.

Scripts: [`topfiles.sh`](topfiles.sh) · [`strict-mode-demo.sh`](strict-mode-demo.sh) · Transcript: [`session.txt`](session.txt)

## The decision that mattered

`topfiles.sh` returns a different exit code for every way it can fail, so a caller can branch on the reason instead of parsing the message.

| Code | Meaning |
|---|---|
| 0 | Ran, printed results |
| 2 | Wrong number of arguments |
| 3 | Path is not a directory |
| 4 | Count is not a positive integer |
| 5 | Directory exists but holds no regular files |

Code 5 is the one worth arguing about. An empty directory is not an error in every context, so returning 0 would also be defensible. I chose non-zero because a caller asking for the largest files and getting none has a problem worth surfacing, and a caller that disagrees can test for 5 specifically.

## What surprised me

`set -e` on its own does not catch a failure in the middle of a pipeline. Four runs of the same failing command:

```
--- 1. no strict mode
reached the next line, COUNT=[0]          script exit: 0

--- 2. set -e only, no pipefail
reached the next line, COUNT=[0]          script exit: 0

--- 3. set -euo pipefail
                                          script exit: 2

--- 4. strict mode, but called inside an if
reached the next line anyway, COUNT=[0]   script exit: 0
```

Run 2 is the trap. `ls` fails, but the pipeline's exit status is `wc`'s, and `wc` succeeded on empty input. Without `pipefail` the script sees success and carries on with a count of zero. That is how a backup script reports "0 files archived" and exits clean.

> [!WARNING]
> Run 4 is the second trap. `set -e` is suppressed for any command whose status is being tested, so wrapping a call in `if` silently turns strict mode off for the whole thing. The check has to happen on the exit code afterwards, not around the call.

<details>
<summary><b>You: so what is the rule</b></summary>

<br>

Start every script with `set -euo pipefail`. Then remember it is a floor, not a guarantee: it does nothing inside `if`, `while`, `&&`, `||`, or a negated command. Anywhere failure actually matters, test the exit code yourself and say what went wrong.

</details>
