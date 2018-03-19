--ch5p1
SELECT last_name || ' earns' || TO_CHAR(salary, '$99,999.00') || ' monthly, but wants '
    || TO_CHAR((salary * 3), '$99,999.00') || '.' AS "Dream Salaries"
    FROM employees;
    
--ch5p2
SELECT last_name, hire_date,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Monday'),
    'fmDay, "the" Ddspth "of" Month, YYYY"."') AS "REVIEW"
    FROM employees;

--ch5p3
SELECT last_name, hire_date, TO_CHAR(hire_date, 'fmDay') 
AS "Day"
FROM employees
ORDER BY TO_CHAR(hire_date - 1, 'D');

--ch5p4
SELECT last_name, NVL(TO_CHAR(commission_pct), 
    'No Commission.') AS "COMM"
FROM employees;

--ch5p5
SELECT job_id,
    DECODE(job_id,
        'AD_PRES' , 'A',
        'ST_MAN' , 'B',
        'IT_PROG' , 'C',
        'SA_REP' , 'D',
        'ST_CLERK', 'E',
        '0') AS "Grade"
    FROM employees
    ORDER BY job_id;


--ch5p6
SELECT job_id,
    (CASE job_id
        WHEN 'AD_PRES' THEN 'A'
        WHEN 'ST_MAN' THEN 'B'
        WHEN 'IT_PROG' THEN 'C'
        WHEN 'SA_REP' THEN 'D'
        WHEN 'ST_CLERK' THEN 'E'
        ELSE '0'
        END) AS "Grade"
    FROM employees
    ORDER BY job_id;
    
--ch5p7
SELECT bldg_code, room,
    (CASE
        WHEN capacity >=100 THEN 'Large'
        WHEN capacity BETWEEN 30 AND 99 THEN 'Medium'
        WHEN capacity < 30 THEN 'Small'
        ELSE ''
        END) AS "Capacity"
    FROM location;

--ch5p8
SELECT call_id, course_name,
    (CASE
        WHEN call_id LIKE '%1__' THEN 'Freshman'
        WHEN call_id LIKE '%2__' THEN 'Sophomore'
        WHEN call_id LIKE '%3__' THEN 'Junior'
        WHEN call_id LIKE '%4__' THEN 'Senior'
        ELSE 'Invalid Level'
        END) AS "Level"
    FROM course
    ORDER BY 3, call_id;

--ch5p9
--Display the animal's name, the date of arrival like 
--"22 of September, 2012"
--with column name Date Arrived. Get the volunteer's
--ID using case for if null, then "There is no 
--volunteer", otherwise display id. Column name should
--be "Volunteer ID". Sort by animal name.
SELECT animal_name, TO_CHAR(arrival_date, 'DD "of" Month, YYYY') AS "Date Arrived",
    (CASE 
        WHEN vol_id IS NULL THEN 'There is no volunteer'
        WHEN vol_id IS NOT NULL THEN TO_CHAR(vol_id)
        END) AS "Volunteer ID"
FROM animal
ORDER BY animal_name;

