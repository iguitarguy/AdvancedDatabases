--ch6p1
SELECT job_id AS "Job", to_char(max(salary), 
    '$99,999') AS "Maximum",
    to_char(min(salary), '$99,999') AS "Minimum", 
    to_char(sum(salary), '$99,999') AS "Total",
    count(*) AS "Number"
    FROM employees
    GROUP by job_id
ORDER BY 1;

--ch6p2
SELECT department_id AS "Department", 
    max(salary)-min(salary) AS "Difference"
    FROM employees
    GROUP BY department_id
    HAVING max(salary)-min(salary) != 0
ORDER BY 1;

--ch6p3
SELECT manager_id AS "Manager", 
    min(salary) AS "Small Sal"
    FROM employees
    WHERE manager_id is not null
    GROUP BY manager_id
    HAVING min(salary) >= 1000
ORDER BY 2 desc;

--ch6p4
SELECT c_sec_day AS "Days", 
    count(*) AS "Number of classes"
    FROM course_section
    GROUP BY c_sec_day;

--ch6p5
SELECT c_sec_day AS "Days",
    TO_CHAR(c_sec_time, 'HH:MI a.m.') AS "Time", 
    count(*) AS "Number of classes"
    FROM course_section
    GROUP BY c_sec_day, 
    TO_CHAR(c_sec_time, 'HH:MI a.m.')
    ORDER BY 1;
    
--ch6p6
SELECT (CASE c_sec_day
            WHEN 'MTWRF' THEN 'Every day of the week'
            WHEN 'MWF' THEN 'Mon - Wed - Fri'
            WHEN 'TR' THEN 'Tues - Thurs'
        END) AS "Days",
        TO_CHAR(c_sec_time, 'fmHHfm:MI a.m.') AS "Time", COUNT(course_id) AS "Number of Classes"
FROM course_section
GROUP BY c_sec_day, to_char(c_sec_time, 'fmHHfm:MI a.m.')
ORDER BY c_sec_day, to_char(c_sec_time, 'fmHHfm:MI a.m.') desc;

--ch6p7
--Display the breed's id "Breed ID", total number "Total" 
--and oldest age of that breed "Oldest Age"
SELECT breed_id AS "Breed ID", 
    count(animal_id) AS "Total", 
    max(animal_age) AS "Oldest Age"
FROM animal
GROUP BY breed_id;
