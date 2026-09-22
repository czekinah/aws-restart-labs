# Absolute and relative paths

![challenges](https://img.shields.io/badge/challenges-10-0F3D1F?style=flat-square) ![depth](https://img.shields.io/badge/tree-7_levels-43B02A?style=flat-square)

Moving around a directory tree, and the point that matters more than moving: `cat`, `cp`, `mv` and `ls` all take paths too, so you rarely need to `cd` first.

Transcript: [`challenges.txt`](challenges.txt)

## The decision that mattered

Absolute or relative is a choice about what you want to survive.

An absolute path means the same thing from anywhere, which is what a script or a cron entry needs, because neither can rely on the working directory being what you expect. A relative path is shorter and moves with the tree, which makes it right at a prompt and wrong in a crontab.

```bash
cp departments/finance/budget.txt departments/finance/reports/2026/
cp ~/practice/cloudmart/README.txt /tmp/cloudmart-readme.txt
```

The first only works from base camp. The second works from anywhere, including inside a script that has no idea where it was launched.

## What surprised me

`cd ../../../../../../../../../../../..` lands on `/` and stops. Root has no parent, so the extra `..` entries are not an error. They resolve to `/` again.

> [!TIP]
> Worth knowing before you write a cleanup script that walks upward.
