# Linux

![labs](https://img.shields.io/badge/labs-15-0F3D1F?style=flat-square) ![challenge](https://img.shields.io/badge/includes-1_challenge_lab-F26B1D?style=flat-square)

The longest track, and the one the rest of the programme assumes you have.

| # | Lab | Score |
|---|---|---|
| 225 | Introduction to Amazon Linux AMI | 1/1 |
| 227 | Linux Command Line | 1/1 |
| 229 | Users and Groups | 1/1 |
| 231 | Editing Files | 1/1 |
| 233 | Working with the File System | 1/1 |
| 235 | Working with Files | 1/1 |
| 237 | Managing File Permissions | 1/1 |
| 239 | Managing Processes | 1/1 |
| 241 | Managing Services and Monitoring | 1/1 |
| 243 | Software Management | 1/1 |
| 245 | Managing Log Files | 1/1 |
| 247 | Working with Commands | 1/1 |
| 249 | The Bash Shell | 1/1 |
| 251 | Bash Shell Scripts | 1/1 |
| 253 | [Challenge] Bash Shell Scripting | 1/1 |

## What this track covers

- **Users, groups and permissions.** Three permission bits against three identity classes, and the reason a service account gets its own group instead of a shared password.
- **Processes and services.** The difference between something running now and something configured to run on boot, which is `systemctl enable` against `systemctl start`.
- **Packages and logs.** Installing from a repository rather than a download, and reading `/var/log` when the service refuses to come up.
- **Bash.** Variables, conditionals, loops, exit codes, and scripts that fail loudly instead of continuing.

## Related deep dives

- [Absolute and relative paths](../../linux-paths/) covers labs 233 and 247 in detail
- [Log growth, scheduling and retention](../../linux-log-management/) picks up where lab 245 stops
