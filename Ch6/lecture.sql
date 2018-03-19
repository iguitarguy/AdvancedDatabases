SELECT animal_sex as "Gender", MIN(animal_weight) AS "Smallest", MAX(animal_weight) AS "Largest"
FROM animal
GROUP BY animal_sex;

SELECT job_id, SUM(salary)
FROM employees
WHERE job_id <> 'SA_MAN'
GROUP BY job_id
HAVING SUM(salary) > 5000
ORDER BY 2;

SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id
HAVING COUNT(employee_id) > 1;
