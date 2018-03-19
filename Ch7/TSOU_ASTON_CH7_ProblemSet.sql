-- Aston Tsou
-- 2018 03 08

-- ch7p1
SELECT DISTINCT emp.job_id, loc.location_id, loc.state_province
FROM employees emp JOIN departments dept
        ON emp.department_id = dept.department_id
    JOIN locations loc
        ON dept.location_id = loc.location_id
ORDER BY 1;

-- ch7p2
SELECT emp.last_name AS "Employee", emp.job_id AS "Job Title", 
       dept.department_name AS "Department"
FROM employees emp JOIN departments dept
        ON emp.department_id = dept.department_id 
WHERE emp.job_id LIKE '%IT%'
ORDER BY 1;

-- ch7p3
SELECT DISTINCT 
    jg.grade_level AS "Grade",
    dept.department_name AS "Department",
    emp.salary AS "Salary"
FROM departments dept JOIN employees emp
        ON dept.department_id = emp.department_id
    JOIN job_grades jg
        ON (emp.salary BETWEEN jg.lowest_sal AND jg.highest_sal)
WHERE dept.department_name LIKE 'S%'
ORDER BY grade_level, department_name, salary DESC;

-- ch7p4
SELECT e.first_name || ' ' || e.last_name AS "Upper Management",
       (CASE 
            WHEN e.job_id LIKE '%PRES%' THEN 'PRESIDENT'
            WHEN e.job_id LIKE '%VP%' THEN 'VICE PRESIDENT'
       END) AS "Job Title"
FROM employees e, employees p
WHERE e.department_id = p.department_id AND p.job_id = 'AD_PRES'
ORDER BY 1;

-- ch7p5
SELECT loc.city AS "City", co.country_name AS "Country"
FROM locations loc RIGHT OUTER JOIN countries co
ON loc.country_id = co.country_id;
        
-- ch7p6
SELECT fac.f_last AS "Faculty", cs.sec_num AS "Section",    
    loc.loc_id AS "Loc ID", loc.bldg_code AS "Building"
FROM faculty fac JOIN course_section cs
    ON fac.f_id = cs.f_id
JOIN location loc ON cs.loc_id = loc.loc_id
WHERE loc.bldg_code = 'BUS'
ORDER BY 1, 2;

-- ch7p7
SELECT emp.last_name AS "Employee", 
    TO_CHAR(emp.hire_date, 'MM/DD/RR') AS "Emp Date", 
    man.last_name AS "Manager", 
    TO_CHAR(man.hire_date, 'MM/DD/RR') AS "Manager Hired"
FROM employees emp JOIN employees man
ON emp.manager_id = man.employee_id
WHERE emp.hire_date < man.hire_date
AND emp.hire_date LIKE '%00' 
AND man.hire_date LIKE '%00';

-- ch7p8
SELECT ani.animal_name AS "Animal Name",
       vol.vol_first || ' ' || vol.vol_last AS "Volunteer",
       bre.breed_type AS "Breed Type",
       bre.breed_name AS "Breed Name"
FROM animal ani JOIN volunteer vol
    ON ani.vol_id = vol.vol_id
JOIN breed bre ON ani.breed_id = bre.breed_id
WHERE bre.breed_type LIKE 'cat' AND bre.breed_name LIKE 'S%'
ORDER BY 4 ASC, 1 ASC;





