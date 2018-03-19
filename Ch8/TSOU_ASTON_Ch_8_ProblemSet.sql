--Aston Tsou
--3/16/18

--ch8p1
SELECT s_first || ' ' || s_last AS "Enrolled Students"
FROM student
WHERE s_id IN (SELECT s_id
    FROM enrollment);

--ch8p2
SELECT employee_id, last_name, salary 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE salary > (SELECT AVG(salary)
    FROM employees) 
    AND l.city LIKE '%Francisco'
ORDER BY salary desc;

--ch8p3
SELECT last_name, department_id, salary
FROM employees emp
WHERE salary = (SELECT avg(salary) 
    FROM employees sub
    WHERE emp.department_id = sub.department_id)
ORDER BY last_name;

--ch8p4
SELECT employee_id, last_name, job_id, salary AS "Total Salary"
FROM employees
WHERE salary > ANY(SELECT salary
    FROM employees
    WHERE job_id LIKE '%MAN%' OR job_id LIKE '%MGR%')
    AND job_id LIKE '%SA_REP%'
    ORDER BY 4;
                
--ch8p5
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id 
    FROM employees 
    WHERE last_name = INITCAP('&&lastname')) 
    AND last_name <> INITCAP('&lastname')
ORDER BY 1;
UNDEFINE lastname

--ch8p6
SELECT department_id, last_name, job_id
FROM employees
WHERE department_id = (SELECT department_id
    FROM departments 
    WHERE department_name = 'Executive');
    
--ch8p7
--Show animal id, animal name, and breed id 
--for all collies and beagles
SELECT animal_id, animal_name, ani.breed_id, breed_name
FROM animal ani JOIN breed bre ON bre.breed_id = ani.breed_id
WHERE ani.breed_id = (SELECT breed_id 
    FROM breed 
    WHERE breed_name = 'Collie')
    OR ani.breed_id = (SELECT breed_id 
    FROM breed 
    WHERE breed_name = 'Beagle');