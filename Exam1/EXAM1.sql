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