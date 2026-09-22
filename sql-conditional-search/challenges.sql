USE conditional_search_demo;

-- 1. Active employees in Manila or Makati earning at least 60000, highest first
SELECT employee_id, first_name, last_name, city, salary
FROM employees
WHERE employment_status = 'Active'
  AND city IN ('Manila', 'Makati')
  AND salary >= 60000
ORDER BY salary DESC;

-- 2. Employee count and average salary per city, cities with at least three people
SELECT city, COUNT(*) AS employee_count, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY city
HAVING COUNT(*) >= 3
ORDER BY employee_count DESC;

-- 3. Managers and completed years of service
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       job_title,
       hire_date,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS completed_years
FROM employees
WHERE job_title LIKE '%Manager%'
ORDER BY completed_years DESC;

-- 4. Employee ID as character text, salary as a signed whole number
SELECT CAST(employee_id AS CHAR) AS employee_id_text,
       CAST(salary AS SIGNED)    AS salary_whole
FROM employees
ORDER BY employee_id
LIMIT 10;

-- 5. Gross, annual and post-increase salary
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       salary                AS gross_monthly,
       salary * 12           AS estimated_annual,
       ROUND(salary * 1.05, 2) AS monthly_after_5pct
FROM employees
ORDER BY gross_monthly DESC
LIMIT 10;

-- 6. Readable status label
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       employment_status,
       CASE employment_status
           WHEN 'Active'   THEN 'Active Staff'
           WHEN 'On Leave' THEN 'Temporarily Unavailable'
           ELSE                 'Former Staff'
       END AS status_label
FROM employees
ORDER BY status_label, full_name;

-- 7. Distinct department and city combinations
SELECT DISTINCT department, city
FROM employees
ORDER BY department, city;

-- 8. Three counts in one row
SELECT COUNT(*)                    AS total_rows,
       COUNT(manager_id)           AS rows_with_manager,
       COUNT(DISTINCT department)  AS distinct_departments
FROM employees;

-- 9. String functions on the name
SELECT CONCAT(first_name, ' ', last_name)          AS full_name,
       UPPER(CONCAT(last_name, ', ', first_name))  AS employee_label,
       CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_characters
FROM employees
ORDER BY name_characters DESC
LIMIT 10;

-- 10. WHERE clause: Finance only
SELECT employee_id, first_name, last_name, job_title
FROM employees
WHERE department = 'Finance';

-- 11. Comparison operators: salary band, excluding Inactive
SELECT first_name, last_name, salary, employment_status
FROM employees
WHERE salary >= 60000
  AND salary <  90000
  AND employment_status <> 'Inactive'
ORDER BY salary;

-- 12. Arithmetic: 7% bonus, annual, monthly plus bonus
SELECT CONCAT(first_name, ' ', last_name)  AS full_name,
       salary                              AS monthly_salary,
       ROUND(salary * 0.07, 2)             AS monthly_bonus,
       salary * 12                         AS annual_salary,
       ROUND(salary * 1.07, 2)             AS monthly_plus_bonus
FROM employees
ORDER BY monthly_salary DESC
LIMIT 10;

-- 13. Logical operators: Active in IT or Finance, not in Makati
SELECT first_name, last_name, department, city
FROM employees
WHERE employment_status = 'Active'
  AND department IN ('IT', 'Finance')
  AND NOT city = 'Makati'
ORDER BY department, city;

-- 14a. Wildcard %: job titles ending in Manager
SELECT first_name, last_name, job_title
FROM employees
WHERE job_title LIKE '%Manager';

-- 14b. Wildcard _: first names whose second character is a
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '_a%';

-- 15. Column aliases
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       salary                             AS monthly_salary,
       salary * 12                        AS annual_salary
FROM employees
ORDER BY annual_salary DESC
LIMIT 10;

-- 16a. NULL: employees without a manager
SELECT employee_id, first_name, last_name, job_title
FROM employees
WHERE manager_id IS NULL;

-- 16b. NULL: employees with a manager
SELECT COUNT(*) AS employees_with_a_manager
FROM employees
WHERE manager_id IS NOT NULL;
