--Themepark database
--Q1
SELECT emplast || ', ' || empfirst AS "Employee", hourlyrate AS "Wages", shopname as "Gift Shop"
FROM magic_employees e, magic_gifts g
WHERE e.shopid = g.shopid;

--Q2
SELECT *
FROM magic_movies m, magic_parades p;

--Q3
SELECT moviename AS "Movie Name", COUNT(*) AS "Number of Characters"
FROM magic_movies m, magic_characters c, magic_parades p
WHERE m.movieid = p.movieid AND p.paradeid = c.paradeid
GROUP BY moviename 
ORDER BY moviename ASC;


