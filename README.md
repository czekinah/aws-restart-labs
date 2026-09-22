# AWS hands-on labs

Infrastructure I built and broke on purpose while going through AWS re/Start.
Each folder is one piece of work: what I built, the commands I ran, the evidence,
and what went wrong.

I came to this from a writing background, so the write-ups are built to be read.
Every folder opens with the architecture or the task, then the one design
decision that actually mattered.

## Projects

| Project | What it covers |
|---|---|
| [Private MySQL on RDS, reached from EC2](rds-private-mysql/) | Subnet groups, security group chaining, schema normalization, join selection |
| [Joins, set operators and the two ways to lose rows](sql-multi-table-joins/) | Inner, left and right joins across five tables, `UNION` and `INTERSECT` and `EXCEPT`, filter placement, Cartesian products |
| [Conditional search and data organization in SQL](sql-conditional-search/) | `WHERE` against `HAVING`, wildcards, NULL handling, derived columns, `CASE` |
| [Log growth, scheduling and retention](linux-log-management/) | Measuring a log four ways, projecting growth, cron, logrotate |
| [curl and wget, and when each one is the right call](curl-vs-wget/) | Exit codes on HTTP errors, checksum comparison, resuming a partial transfer |
| [Absolute and relative paths in Linux](linux-paths/) | Path resolution, and why scripts need absolute paths |

## Conventions

Every folder follows [`TEMPLATE.md`](TEMPLATE.md). SQL, scripts and terminal
transcripts are committed as real files rather than pasted into code blocks, so
they can be read, searched and rerun.

No credentials, key files or account numbers are in this repository. See
[`.gitignore`](.gitignore).

Lab briefs come from my instructor's repository,
[jjrs07/restart_batch_29_and_30](https://github.com/jjrs07/restart_batch_29_and_30).
The work here is mine.
