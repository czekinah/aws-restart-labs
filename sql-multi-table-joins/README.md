# Joins, set operators and the two ways to lose rows

Fifteen queries across five related tables: employees, departments, projects,
assignments and contractors. Inner, left and right joins, an emulated full outer
join, `UNION`, `INTERSECT`, `EXCEPT`, and two deliberate mistakes.

Queries: [`challenges.sql`](challenges.sql) ·
Output: [`challenges-output.txt`](challenges-output.txt)

## The decision that mattered

Where you put a filter on the right-hand table decides whether a `LEFT JOIN` is
still a left join. In `ON`, the filter limits what counts as a match and the
unmatched left rows survive with NULLs. In `WHERE`, those NULL rows fail the test
and get discarded, which silently turns the query into an inner join:

```sql
SELECT (SELECT COUNT(*) FROM projects p
   LEFT JOIN employee_projects ep ON ep.project_id = p.project_id AND ep.hours_per_week >= 20) AS filter_in_on,
       (SELECT COUNT(*) FROM projects p
   LEFT JOIN employee_projects ep ON ep.project_id = p.project_id WHERE ep.hours_per_week >= 20) AS filter_in_where;
```

| filter_in_on | filter_in_where |
|---|---|
| 13 | 4 |

Same tables, same filter, nine rows gone. Neither query errors. If the question is
"show every project and its busy assignees", only the first one answers it.

## The other way to lose control

Omitting the join condition entirely does not error either. It returns every
combination:

```
employee_rows  project_rows  possible_combinations
30             11            330
```

30 by 11 is harmless. The same mistake against two tables of a million rows is
not, which is why the count is worth estimating before the query is run rather
than after.

## Set operators

`UNION` removes duplicates, `UNION ALL` keeps them. That is not a performance
footnote: counting worker records per city needs the duplicates, because two
people in the same city are two people. `INTERSECT` answers which cities have both
employees and contractors, and `EXCEPT` gives the contractor-only cities, which is
the `MINUS` concept under its standard name.
