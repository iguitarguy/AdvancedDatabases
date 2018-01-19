--ch2p1
SELECT DISTINCT s_class AS "Classification"
FROM student;

--ch2p2
SELECT employee_id AS "Emp#",
    last_name || ', ' || first_name AS "Employee",
    job_id AS "Job Title", hire_date AS "Date Hired"
FROM employees;

--ch2p3
SELECT f_first || ' ' || f_mi || '. ' || f_last || ':   ' || f_phone
AS "Faculty Name: Phone" 
FROM faculty;

--ch2p4
SELECT last_name || '''s full salary is: ' AS "Employee",
    (salary + (NVL(commission_pct, 0) * 1000)) AS "Full Salary" 
FROM employees;

--ch2p5
SELECT employee_id AS "Employee ID", start_date 
AS "Start Date", end_date 
AS "End_date", (end_date - start_date)
AS "Days of employment"
FROM job_history
ORDER BY (end_date - start_date);

--ch2p6
-- Select the animal id using Animal ID as
--  column header
-- Select the animal's name, weight,
--  and age using 
-- Animal Information as column header
-- Animal information is a statement summarizing name, 
--  weight and age of each animal
-- Use the alternative quote delimiter as shown
SELECT animal_id AS "Animal ID", animal_name || 
    '''s weight is ' || animal_weight ||
    ' lb and age is ' || animal_age ||
    ' years old.' AS "Animal Information" 
FROM animal
ORDER BY animal_name;