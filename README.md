<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/banner-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/banner-light.svg">
  <img src="assets/banner-light.svg" alt="AWS re/Start Labs. Czekinah Tolentino, cohort PHMAN29, Edukasyon.ph." width="100%">
</picture>

# AWS re/Start labs

![program](https://img.shields.io/badge/program-AWS_re%2FStart-232F3E?style=flat-square) ![partner](https://img.shields.io/badge/partner-Edukasyon.ph-19A29A?style=flat-square) ![labs](https://img.shields.io/badge/Canvas_labs-69%2F69-2E8B2E?style=flat-square) ![kc](https://img.shields.io/badge/regular_KCs-83%2F83_submitted-19A29A?style=flat-square) ![cohort](https://img.shields.io/badge/cohort-PHMAN29-FF9900?style=flat-square)

What I built, what broke, and the one decision in each lab that was worth writing down.

**Czekinah Tolentino · PHMAN29**

Updated 15 October 2026. Canvas results last verified 13 October 2026, 22:49 Manila.

## Start here

- [Coursework record](coursework/): all 69 recorded labs, grouped by topic.
- [Instructor exercise tracker](instructor-exercises/): the nine Batch 29/30 exercises, existing work, and the evidence still needed.
- [Challenge results](challenges/): eleven separate challenge reports and their verified outcomes.
- [Latest lab notes](coursework/latest-lab-notes.md): scaling, failover, migration, storage, troubleshooting, and machine learning.

Canvas completion and instructor-exercise completion are tracked separately. A related Canvas lab is useful background, not proof that a different deployment has been finished.

## Deep dives

The existing deep dives, with commands, transcripts, and the failures worth keeping.

| Lab | The thing worth knowing | Folder |
|---|---|---|
| Private MySQL on RDS | The inbound rule sources from the server's security group, not a CIDR | [`rds-private-mysql/`](rds-private-mysql/) |
| Joins and set operators | A right-table filter in `WHERE` silently turns a `LEFT JOIN` into an inner join | [`sql-multi-table-joins/`](sql-multi-table-joins/) |
| Conditional search | `WHERE` filters rows, `HAVING` filters groups. Swapping them gives a wrong answer, not an error | [`sql-conditional-search/`](sql-conditional-search/) |
| Log growth and retention | `logrotate` with no `create` leaves no active log file behind | [`linux-log-management/`](linux-log-management/) |
| curl and wget | `curl` exits 0 on a 404 unless you pass `--fail` | [`curl-vs-wget/`](curl-vs-wget/) |
| Bash strict mode | `set -e` alone misses a failure mid-pipeline, and `if` switches it off entirely | [`bash-failing-loudly/`](bash-failing-loudly/) |
| Linux paths | Scripts need absolute paths. Prompts do not | [`linux-paths/`](linux-paths/) |

## Coursework

**69/69 labs submitted, 69/69 points. 83/83 regular knowledge checks submitted, 8,280/8,300 points (99.76%).** The 13 certification-preparation checks are separate and are not included in these completed totals. See the dated [verification record](coursework/verification.md).

| Track | Labs | Track | Labs |
|---|---|---|---|
| [Linux](coursework/linux/) | 15 | [Security](coursework/security/) | 8 |
| [Databases](coursework/databases/) | 11 | [Python and automation](coursework/python-and-automation/) | 3 |
| [Networking](coursework/networking/) | 10 | [Cloud foundations](coursework/cloud-foundations/) | 2 |
| [Systems operations](coursework/systems-operations/) | 19 | [Machine learning](coursework/machine-learning/) | 1 |

## How to read a deep dive

Four parts every time: what I built, the decision that mattered, the evidence, what broke. SQL and transcripts are committed as files rather than pasted into code blocks, so you can read them or rerun them.

<details>
<summary><b>You: why keep the failures in</b></summary>

<br>

Because the failures are the part that took time. Some of these labs ran clean and taught me nothing I could not have read. The others broke in ways the brief did not mention, and those are the entries I would actually bring to an interview.

</details>

> [!NOTE]
> This is a public learning portfolio. Raw console captures, private submission PDFs, credentials, keys, account identifiers, and temporary sign-in links stay out of the repository. See [`.gitignore`](.gitignore).

Delivered through the AWS re/Start programme with [Edukasyon.ph](https://www.edukasyon.ph/aws-re-start). Some lab briefs come from [jjrs07/restart_batch_29_and_30](https://github.com/jjrs07/restart_batch_29_and_30). The work is mine.
