--ch3p1
SELECT last_name AS "Employee", salary AS "Salary"
FROM employees
WHERE salary NOT BETWEEN 2000 AND  9500
ORDER BY salary DESC;

--ch3p2
SELECT s_last AS "Student", s_dob AS "Date Of Birth"
FROM student
WHERE s_dob BETWEEN '01-MAY-1985' AND '30-SEP-1985'
ORDER BY s_last;

--ch3p3
SELECT bldg_code, room, capacity
FROM location
WHERE capacity > 30 AND room BETWEEN 100 AND 199
ORDER BY capacity;

--ch3p4
SELECT last_name AS "Name", job_id AS "Job Title"
FROM employees
WHERE commission_pct IS NULL AND job_id LIKE '%MAN' OR job_id LIKE '%MGR'
ORDER BY last_name;

--ch3p5
SELECT call_id, course_name
FROM course
WHERE course_name LIKE '%C++%';

--ch3p6
SELECT s_first || ' ' || s_mi || '. ' || s_last AS "Full Name", 
    s_dob AS "Date of Birth", round(((sysdate - s_dob)/365),2) AS "Age"
FROM student
WHERE s_dob LIKE '%86'
ORDER BY s_dob;

--ch3p7
SELECT last_name || ', ' || job_id AS "Employees", salary as "Salary"
FROM employees
WHERE salary BETWEEN &minSalary AND &maxSalary
ORDER BY last_name;

--ch3p8
SELECT department_id, &&col_name
FROM departments
WHERE department_id > &department_num
ORDER BY &col_name;
UNDEFINE col_name

--ch3p9
--Get animal name, weight, and age.
--Restrict weight to less than or equal to 30
--Prompt user for age minimum and maximum
--Sort by age
SELECT animal_name, animal_weight, animal_age
FROM animal
WHERE animal_weight <= 30 AND animal_age BETWEEN &minAge AND &maxAge
ORDER BY animal_age;


