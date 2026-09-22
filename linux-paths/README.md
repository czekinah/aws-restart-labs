# Absolute and relative paths in Linux

Navigating a directory tree without getting lost, and the point that matters more
than navigation: `cat`, `cp`, `mv` and `ls` all take paths too, so you rarely need
to `cd` anywhere first.

## What I did

Ran the ten path challenges against a seven-level practice tree, proving each one
with `pwd` and `ls` or `cat` rather than assuming it worked. Full transcript in
[`challenges.txt`](challenges.txt).

## The decision that mattered

Absolute or relative is a choice about what you want to survive. An absolute path
means the same thing from anywhere, which is what a script or a cron entry needs,
because neither one can rely on the working directory being what you expect. A
relative path is shorter and moves with the tree, which is what makes it right at
a prompt and wrong in a crontab.

The copy challenges make this concrete:

```bash
cp departments/finance/budget.txt departments/finance/reports/2026/
cp ~/.../practice/cloudmart/README.txt /tmp/cloudmart-readme.txt
```

The first only works from base camp. The second works from anywhere, including
from inside a script that has no idea where it was launched.

## What surprised me

`cd ../../../../../../../../../../../..` lands on `/` and stops. Root has no
parent, so the extra `..` entries are not an error, they just resolve to `/`
again. Worth knowing before you write a cleanup script that walks upward.
