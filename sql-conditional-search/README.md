# Conditional search and data organization

![rows](https://img.shields.io/badge/dataset-30_employees-0F3D1F?style=flat-square) ![queries](https://img.shields.io/badge/queries-16-43B02A?style=flat-square) ![engine](https://img.shields.io/badge/engine-MariaDB_10.11-F26B1D?style=flat-square)

Sixteen queries over one employee table: filtering, grouping, wildcards, NULLs, type conversion, derived columns.

Queries: [`challenges.sql`](challenges.sql) · Output: [`challenges-output.txt`](challenges-output.txt)

## The decision that mattered

`WHERE` and `HAVING` both filter. Putting a condition in the wrong one produces a plausible wrong answer, not an error.

`WHERE` runs before grouping. `HAVING` runs after, so it is the only place an aggregate can be tested.

```sql
SELECT city, COUNT(*) AS employee_count, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY city
HAVING COUNT(*) >= 3;
```

`WHERE COUNT(*) >= 3` cannot work here. At the point `WHERE` runs there are no groups yet to count.

> [!IMPORTANT]
> A missing manager is not a value, so it fails every comparison including `= NULL`. The test is `IS NULL`. Get it wrong and you get zero rows with nothing to explain why.

<details>
<summary><b>You: anything interesting in the results</b></summary>

<br>

Six cities, five with three or more employees. Six job titles containing `Manager`, longest tenure eight completed years. And a `CASE` that maps the `employment_status` enum to labels a non-technical reader can act on: Active Staff, Temporarily Unavailable, Former Staff.

</details>
