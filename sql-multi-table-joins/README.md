# Joins, set operators, and two ways to lose rows quietly

![tables](https://img.shields.io/badge/tables-5-0F3D1F?style=flat-square) ![queries](https://img.shields.io/badge/queries-15-43B02A?style=flat-square) ![engine](https://img.shields.io/badge/engine-MariaDB_10.11-F26B1D?style=flat-square)

Five related tables, fifteen queries, and two mistakes that return a wrong answer instead of an error.

Queries: [`challenges.sql`](challenges.sql) · Output: [`challenges-output.txt`](challenges-output.txt)

## The decision that mattered

Where you put a filter on the right-hand table decides whether a `LEFT JOIN` is still a left join.

In `ON`, the filter limits what counts as a match and unmatched left rows survive with `NULL`s. In `WHERE`, those `NULL` rows fail the test and get dropped, which turns the query into an inner join without saying so.

```
filter_in_on   filter_in_where
13             4
```

Same tables, same filter, nine rows gone, no error either way. If the question is "every project and its busy assignees", only the first one answers it.

## The other way

Drop the join condition entirely and nothing errors. You get every combination.

```
employee_rows  project_rows  possible_combinations
30             11            330
```

> [!TIP]
> Estimate the product before you run the query, not after. 30 by 11 is harmless. Two tables of a million rows is not.

<details>
<summary><b>You: UNION or UNION ALL</b></summary>

<br>

`UNION` removes duplicates, `UNION ALL` keeps them. Not a performance footnote. Counting worker records per city needs the duplicates, because two people in the same city are two people. `INTERSECT` gives cities with both employees and contractors. `EXCEPT` gives contractor-only cities, which is `MINUS` under its standard name.

</details>
