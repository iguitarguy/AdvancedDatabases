--P1
SELECT employee_id, last_name AS "Last Name", salary 
    AS "Current Salary",
    round(salary+ salary*0.15,0) 
    AS "New Salary", round(salary*0.15,0) AS "Increase"
FROM employees
WHERE round(salary+ salary*0.15,0) BETWEEN &minsalary AND &maxsalary
ORDER BY round(salary+ salary*0.15,0) DESC;

--P2
SELECT RPAD(s_last || ', ' || s_first, 22, '*') || 
    ROUND(((SYSDATE - s_dob)/365),0) AS "Student Name and Age",
    s_pin AS "Pin", REVERSE(TO_CHAR(s_pin)) AS "Coded Pin"
FROM student 
ORDER BY s_last;

--P3
SELECT s_id AS "Student Number", c_sec_id 
    AS "Section", NVL(grade, '--') AS "Grade"
FROM enrollment
WHERE grade IS NULL OR grade NOT LIKE 'C'
ORDER BY 3;

--P4
SELECT last_name || ', ' || first_name AS "Employee", 
       hire_date AS "Date Hired",
       NEXT_DAY(ADD_MONTHS(hire_date, 6), 'WEDNESDAY') 
       AS "6 Months Review"
FROM employees
WHERE hire_date > '01-JAN-00'
ORDER BY hire_date;

--P5
SELECT c_sec_id AS "Section ID", sec_num AS "Number",
       c_sec_day AS "Days", 
       TO_CHAR(c_sec_time, 'HH:MI a.m.') AS "Time"
FROM course_section
WHERE c_sec_day LIKE 'M%'
ORDER BY c_sec_day, c_sec_time;

--Exam Problem 1
SELECT animal_name AS "Animal name", animal_age 
AS "Animal age", &&columnName AS "New Column"
FROM animal
WHERE &columnName = '&valueRequested'
ORDER BY &columnName, 2;
UNDEFINE columnName

--EXAM Problem 2
SELECT last_name || ', ' || first_name 
AS "Employee", NVL(salary,0) 
AS "Base", (NVL(salary,0) + NVL(salary,0)*NVL(commission_pct,0))* 12
AS "Annual Salary", to_char(hire_date, 'Month dd, yyyy')
AS "Employement Date", TRUNC(((SYSDATE - hire_date)/365),0)
AS "Years employed"
FROM employees
WHERE TRUNC(((SYSDATE - hire_date)/365),0) >= 25
ORDER BY last_name;
SELECT SYSDATE from employees;

