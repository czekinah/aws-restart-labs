USE multi_table_demo;

-- 1. Finance employees, employees joined to departments
SELECT e.employee_id, CONCAT(e.first_name,' ',e.last_name) AS employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
WHERE d.department_name = 'Finance';

-- 2. Employees assigned to an Active project
SELECT DISTINCT CONCAT(e.first_name,' ',e.last_name) AS employee_name, p.project_name, p.project_status
FROM employees e
INNER JOIN employee_projects ep ON ep.employee_id = e.employee_id
INNER JOIN projects p           ON p.project_id   = ep.project_id
WHERE p.project_status = 'Active'
ORDER BY employee_name;

-- 3. Four tables: employee, department, project, role, weekly hours
SELECT CONCAT(e.first_name,' ',e.last_name) AS employee_name,
       d.department_name, p.project_name, ep.project_role, ep.hours_per_week
FROM employees e
INNER JOIN departments d        ON d.department_id = e.department_id
INNER JOIN employee_projects ep ON ep.employee_id  = e.employee_id
INNER JOIN projects p           ON p.project_id    = ep.project_id
ORDER BY d.department_name, employee_name
LIMIT 12;

-- 4. Every project, including those with nobody assigned
SELECT p.project_id, p.project_name, COUNT(ep.employee_id) AS assigned_people
FROM projects p
LEFT JOIN employee_projects ep ON ep.project_id = p.project_id
GROUP BY p.project_id, p.project_name
ORDER BY assigned_people, p.project_id;

-- 5. The same answer with RIGHT JOIN, assignments on the left
SELECT p.project_id, p.project_name, COUNT(ep.employee_id) AS assigned_people
FROM employee_projects ep
RIGHT JOIN projects p ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name
ORDER BY assigned_people, p.project_id;

-- 6. Full outer join emulated: departments and employees, keeping unmatched rows on both sides
SELECT d.department_name, CONCAT(e.first_name,' ',e.last_name) AS employee_name
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
UNION
SELECT d.department_name, CONCAT(e.first_name,' ',e.last_name)
FROM departments d
RIGHT JOIN employees e ON e.department_id = d.department_id
ORDER BY department_name, employee_name
LIMIT 12;

-- 7. UNION: distinct cities across employees and contractors
SELECT city FROM employees
UNION
SELECT city FROM contractors
ORDER BY city;

-- 8. UNION ALL keeps duplicates, so the counts are real headcounts
SELECT city, COUNT(*) AS worker_records
FROM (
    SELECT city FROM employees
    UNION ALL
    SELECT city FROM contractors
) AS all_workers
GROUP BY city
ORDER BY worker_records DESC, city;

-- 9. INTERSECT: cities that have both employees and contractors
SELECT city FROM employees
INTERSECT
SELECT city FROM contractors
ORDER BY city;

-- 10. EXCEPT, the MINUS concept: contractor-only cities
SELECT city FROM contractors
EXCEPT
SELECT city FROM employees
ORDER BY city;

-- 11. Employees with no project assignment
SELECT CONCAT(e.first_name,' ',e.last_name) AS employee_name, e.job_title
FROM employees e
LEFT JOIN employee_projects ep ON ep.employee_id = e.employee_id
WHERE ep.employee_id IS NULL
ORDER BY employee_name;

-- 12. Departments with no employees
SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- 13. Every project with its assignment count, including zero
SELECT p.project_name, p.project_status, COUNT(ep.employee_id) AS assignment_count
FROM projects p
LEFT JOIN employee_projects ep ON ep.project_id = p.project_id
GROUP BY p.project_id, p.project_name, p.project_status
ORDER BY assignment_count DESC;

-- 14a. Filter in ON: unmatched projects survive, their assignment columns are NULL
SELECT p.project_name, ep.employee_id, ep.project_role
FROM projects p
LEFT JOIN employee_projects ep
       ON ep.project_id = p.project_id
      AND ep.hours_per_week >= 20
ORDER BY p.project_name
LIMIT 12;

-- 14b. Same filter in WHERE: the NULL rows fail the test and the LEFT JOIN collapses to an INNER JOIN
SELECT p.project_name, ep.employee_id, ep.project_role
FROM projects p
LEFT JOIN employee_projects ep ON ep.project_id = p.project_id
WHERE ep.hours_per_week >= 20
ORDER BY p.project_name
LIMIT 12;

-- 14c. The row counts side by side
SELECT
  (SELECT COUNT(*) FROM projects p
     LEFT JOIN employee_projects ep ON ep.project_id = p.project_id AND ep.hours_per_week >= 20) AS filter_in_on,
  (SELECT COUNT(*) FROM projects p
     LEFT JOIN employee_projects ep ON ep.project_id = p.project_id WHERE ep.hours_per_week >= 20) AS filter_in_where;

-- 15. Cartesian product: estimate it before running it
SELECT (SELECT COUNT(*) FROM employees) AS employee_rows,
       (SELECT COUNT(*) FROM projects)  AS project_rows,
       (SELECT COUNT(*) FROM employees) * (SELECT COUNT(*) FROM projects) AS possible_combinations;

-- 15b. Count only. Never select the rows themselves from a join with no ON condition.
SELECT COUNT(*) AS rows_without_a_join_condition
FROM employees e, projects p;
