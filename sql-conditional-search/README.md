# Conditional search and data organization in SQL

Sixteen queries over a thirty-row employee table: filtering, grouping, wildcards,
NULL handling, type conversion and derived columns.

Queries: [`challenges.sql`](challenges.sql) ·
Output: [`challenges-output.txt`](challenges-output.txt)

## The decision that mattered

`WHERE` and `HAVING` both filter, and putting a condition in the wrong one is the
mistake that produces a plausible wrong answer rather than an error. `WHERE`
filters rows before grouping. `HAVING` filters groups after aggregation, so it is
the only place an aggregate can be tested:

```sql
SELECT city, COUNT(*) AS employee_count, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY city
HAVING COUNT(*) >= 3;
```

`WHERE COUNT(*) >= 3` cannot work here, because at the point `WHERE` runs there
are no groups yet to count.

The same care applies to NULL. A missing manager is not a value, so it fails every
comparison including `= NULL`. The test is `IS NULL`, and getting this wrong
returns zero rows with no error to explain why.

## Useful results

- Six cities, five of them with three or more employees
- Six job titles containing `Manager`, longest tenure eight completed years
- `CASE` mapping the `employment_status` enum to labels a non-technical reader
  can act on: Active Staff, Temporarily Unavailable, Former Staff
