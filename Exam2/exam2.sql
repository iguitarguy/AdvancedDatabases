--1
SELECT l.bldg_code, l.room, 
t.term_desc, c.call_id, cs.sec_num, 
cs.c_sec_day, TO_CHAR(cs.c_sec_time, 'HH:MI AM') as TIME 
FROM location l JOIN course_section cs ON l.loc_id = cs.loc_id
JOIN term t ON cs.term_id = t.term_id
JOIN course c ON cs.course_id = c.course_id
ORDER BY 1, 2;

--2
SELECT s_first as "FIRST", s_last as "LAST", 
    TO_CHAR(s_dob, 'MM/DD/YYYY') as "BIRTHDATE"
FROM student
WHERE s_first <> 'Sarah' AND s_last <> 'Miller'
    AND s_class = (SELECT s_class 
    FROM student 
    WHERE s_first = 'Sarah' AND s_last = 'Miller')
    ;