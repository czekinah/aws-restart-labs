# Databases

![labs](https://img.shields.io/badge/labs-11-0F3D1F?style=flat-square) ![engines](https://img.shields.io/badge/engines-MySQL_·_Aurora_·_DynamoDB-43B02A?style=flat-square)

From `CREATE TABLE` to a managed engine with an application in front of it.

| # | Lab | Score |
|---|---|---|
| 268 | Database Table Operations | 1/1 |
| 269 | Insert, Update, and Delete Data in a Database | 1/1 |
| 270 | Selecting Data from a Database | 1/1 |
| 271 | Performing a Conditional Search | 1/1 |
| 272 | Working with Functions | 1/1 |
| 273 | Organizing Data | 1/1 |
| 160 | Build Your Database Server and Interact with Your DB Using an App | 1/1 |
| 274 | Introduction to Amazon Aurora | 1/1 |
| 275 | Introduction to Amazon DynamoDB | 1/1 |
| 162 | [Challenge] Build and Access an RDS Server | 1/1 |
| 179 | Migrate to Amazon RDS | 1/1 |

## What this track covers

- **DDL against DML.** Creating and altering structure is a different risk profile from inserting and deleting rows. One is hard to reverse, the other is hard to notice.
- **Query shape.** `WHERE` before grouping, `HAVING` after, functions and aliases for anything a human has to read.
- **Managed against self-managed.** RDS and Aurora hand back the engine, the endpoint and the backups. What stays yours is the schema, the access rules and the query cost.
- **Relational against key-value.** DynamoDB makes you choose the access pattern first and design the key around it, which is the opposite order from everything above it on this list.

## Related deep dives

- [Conditional search and data organization](../../sql-conditional-search/) extends labs 271 and 273
- [Joins, set operators, and two ways to lose rows quietly](../../sql-multi-table-joins/) extends lab 270
- [Private MySQL on RDS, reached from EC2](../../rds-private-mysql/) documents Lab 162, including the later evidence rerun
- [Migration notes](../latest-lab-notes.md#179-migrate-to-amazon-rds) record the Lab 179 data and application checks
