# AWS hands-on labs

![program](https://img.shields.io/badge/program-AWS_re%2FStart-0F3D1F?style=flat-square) ![labs](https://img.shields.io/badge/labs-6-43B02A?style=flat-square) ![focus](https://img.shields.io/badge/focus-RDS_·_SQL_·_Linux-F26B1D?style=flat-square)

What I built, what broke, and the one decision in each lab that was worth writing down.

## Labs

| Lab | The thing worth knowing | Folder |
|---|---|---|
| Private MySQL on RDS | The inbound rule sources from the server's security group, not a CIDR | [`rds-private-mysql/`](rds-private-mysql/) |
| Joins and set operators | A right-table filter in `WHERE` silently turns a `LEFT JOIN` into an inner join | [`sql-multi-table-joins/`](sql-multi-table-joins/) |
| Conditional search | `WHERE` filters rows, `HAVING` filters groups. Swapping them gives a wrong answer, not an error | [`sql-conditional-search/`](sql-conditional-search/) |
| Log growth and retention | `logrotate` with no `create` leaves no active log file behind | [`linux-log-management/`](linux-log-management/) |
| curl and wget | `curl` exits 0 on a 404 unless you pass `--fail` | [`curl-vs-wget/`](curl-vs-wget/) |
| Linux paths | Scripts need absolute paths. Prompts do not | [`linux-paths/`](linux-paths/) |

## How to read a folder

Four parts every time: what I built, the decision that mattered, the evidence, what broke. SQL and transcripts are committed as files rather than pasted into code blocks, so you can read them or rerun them.

<details>
<summary><b>You: why keep the failures in</b></summary>

<br>

Because the failures are the part that took time. Three of these labs ran clean and taught me nothing I could not have read. The other three broke in ways the brief did not mention, and those are the entries I would actually bring to an interview.

</details>

> [!NOTE]
> No credentials, key files or account numbers here. See [`.gitignore`](.gitignore).

Lab briefs come from [jjrs07/restart_batch_29_and_30](https://github.com/jjrs07/restart_batch_29_and_30). The work is mine.
