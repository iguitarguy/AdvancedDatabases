--Inner JOIN ON
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

--Inner JOIN ON 2
SELECT e.last_name, d.department_name, city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id;

--Natural JOIN
SELECT e.last_name, d.department_name, department_id
FROM employees e NATURAL JOIN departments d;

--JOIN - USING clause
SELECT e.last_name, j.start_date, j.end_date
FROM employees e JOIN job_history j
USING (department_id);

-- INNER JOIN syntax
SELECT d.department_id AS "Dept ID", e.first_name || ' ' || e.last_name AS "Emp Name",
       d.department_name AS "Dept Name", l.city, l.STATE_PROVINCE
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.LOCATION_ID
WHERE l.STATE_PROVINCE Like 'Washington';

-- NATURAL JOIN sytax
SELECT d.department_id, d.department_name, location_id, loc.city
FROM   departments d NATURAL JOIN locations loc
ORDER BY 1;

-- Natural Join
SELECT e.first_name || ' ' || e.last_name AS "Emp Name",
       d.department_name AS "Dept Name", department_id
FROM employees e NATURAL JOIN departments d;

-- non equijoin
SELECT e.last_name, e.salary, j.grade_level
FROM employees e JOIN job_grades j 
ON e.salary BETWEEN j.lowest_sal AND j.HIGHEST_SAL;

-- Left Outer Join
SELECT e.last_name, e.department_id, d.department_name
FROM   employees e LEFT OUTER JOIN departments d
ON   e.department_id = d.department_id;

-- Right Outer Join
SELECT e.last_name, d.department_id, d.department_name
FROM   employees e RIGHT OUTER JOIN departments d
ON   e.department_id = d.department_id;

-- Full Outer Join
SELECT e.last_name, e.department_id, d.department_name
FROM   employees e FULL OUTER JOIN departments d
ON   e.department_id = d.department_id;

-- CROSS JOIN
SELECT e.last_name, d.department_name
FROM employees e CROSS JOIN departments d;

--Non EQUIJOIN
SELECT e.last_name, e.salary, jg.grade_level
FROM employees e JOIN job_grades jg
ON e.salary BETWEEN jg.lowest_sal AND jg.highest_sal;

--Left Outer Join
SELECT e.last_name, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

--Right Outer Join
SELECT e.last_name, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

--FULL Outer Join
SELECT e.last_name, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

--CROSS JOIN
SELECT last_name, department_name
FROM employees
CROSS JOIN departments;
