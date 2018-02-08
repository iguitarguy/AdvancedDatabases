--ch4p1
SELECT SYSDATE FROM dual;

--ch4p2
SELECT employee_id, last_name, round(NVL(salary, 0), 0) as "SALARY", 
round(NVL(salary * .155 + salary, 0),0) AS "New Salary"
FROM employees;

--ch4p3
SELECT employee_id, last_name, round(NVL(salary, 0), 0) as "SALARY",
round(NVL(salary * .155 + salary, 0), 0) AS "New Salary",
round(NVL(salary * .155, 0), 0) as "Increase" 
FROM employees;

--ch4p4
SELECT INITCAP(last_name) AS "Name", LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%';

--ch4p5
SELECT INITCAP(last_name) AS "Name", LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE INITCAP('&START_LETTER%');

--ch4p6
SELECT last_name, round((SYSDATE - hire_date),0) AS "MONTHS_WORKED"
FROM employees
ORDER BY (SYSDATE-hire_date);

--ch4p7
SELECT last_name, LPAD(salary, 15, '$') AS "SALARY"
FROM employees;

--ch4p8
SELECT RPAD(last_name, 8) || RPAD(' ', salary/1000+1, '*') AS "EMPLOYEES_AND_THEIR_SALARIES"
FROM employees
ORDER BY salary DESC;

--ch4p9
SELECT last_name, TRUNC((SYSDATE - hire_date)/7) AS "TENURE"
FROM employees
WHERE department_id = 90
ORDER BY (tenure) DESC;

--ch4p10
--Create a query to display the animal name
--as NAME, the number of days animal is in
--shelter from arrival to today as SHELTER_TIME
--and indicate the weight with asterisks as WEIGHT
--sort by shelter time in descending order
SELECT animal_name AS "NAME",
round(SYSDATE - arrival_date,0) AS "SHELTER_TIME", RPAD(' ', animal_weight, '*') AS "WEIGHT"
FROM animal
ORDER BY round(SYSDATE - arrival_date,0) DESC;