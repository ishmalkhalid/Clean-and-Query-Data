-- 1. do some rudimentary data cleaning by modifying values in a column or columns (such as change '' to NULL, cast types, etc.) … instead of adding the results of the query or queries to report.md, write the motivation for modifying / cleaning your data in this way	
Delete from suicidestats where suicides_no = '';
Delete from suicidestats where population = '';

-- 2. the total number of rows in the database
SELECT COUNT (*) FROM suicidestats;

-- 3. show the first 15 rows, but only display 3 columns (your choice)
SELECT age, sex, population FROM suicidestats
LIMIT 15;

-- 4. do the same as above, but choose a column to sort on, and sort in descending order
SELECT age, sex, population
FROM suicidestats
ORDER BY population desc
LIMIT 15;

--5. add a new column without a default value
ALTER TABLE suicidestats
ADD COLUMN city;

--6. set the value of that new column
UPDATE suicidestats SET city = "N/A";

--7. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT age
FROM suicidestats;

--8. group rows together by a column value (your choice) and use an aggregate function to calculate something about that group (count of all members of the group, the average of a column of the members of the group)
----- show the column that is used for grouping AND the result of the aggregate function (so, 2 columns minimum on output)

SELECT country, sum(suicides_no) FROM suicidestats
GROUP BY country;

--9. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups (for example, show all genres that have more than 2 movies in it and only show the genre and the number of movies for that genre).
---- you'll use a HAVING clause to do this (covered in the slides on group by)

SELECT country, sum(suicides_no) FROM suicidestats
GROUP BY country
HAVING sum(suicides_no) > 100000;

--Add another 3 queries of your own that helps you gain some insight on your data (ok to reproduce the work that you did previously for the previous homework… but using sql instead of python). You must include one of each of the following in any of your queries (that is, one of #1 and one of #2 below in any part of your work for queries 10-12):
--10. Find the rounded average number of suicides in Japan for each age group 
--------------------------------------------------------
SELECT round(avg(suicides_no))
FROM suicidestats
WHERE country = "Japan";

--11. Display the country, age and sex for the max number of suicides 
---------------------------------------------------------
SELECT country, age, sex, max(suicides_no) FROM suicidestats;

--12. Display the country for the sum of suicides once the values are grouped by country and order them in ascending order by the sum of suicides and limit them to 5 categories
SELECT country, sum(suicides_no) FROM suicidestats GROUP BY country ORDER BY sum(suicides_no) limit 5;
