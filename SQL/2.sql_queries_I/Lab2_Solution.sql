USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name='SCARLETT'; 

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT * FROM rental;
SELECT COUNT(rental_date) FROM rental; -- available for rental
SELECT COUNT(rental_date) - COUNT(return_date)  FROM sakila.rental; -- rented 

SELECT SUM(ISNULL(return_date)) FROM sakila.rental; -- easier way to check the rented movies

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) FROM sakila.film;
SELECT MIN(length) FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT *, CONCAT(floor(film.length/60),':', 
CASE    
WHEN film.length - floor(film.length/60)*60 < 1 THEN '0'
ELSE FLOOR(film.length - floor(film.length/60)*60 )
END) AS hours 
AND AVG(hours) OVER (PARTITION BY film_id)
FROM sakila.film;

SELECT AVG(hours) AS average
FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT * FROM sakila.actor;
SELECT COUNT(last_name) FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF (MAX(LAST_UPDATE), MIN(RENTAL_DATE))
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, DATE_FORMAT(rental_date,'%M') as month, DATE_FORMAT(rental_date,'%W') as weekday 
FROM sakila.rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, DATE_FORMAT(rental_date,'%W') as day_type
FROM sakila.rental;

SELECT *, WEEKDAY(rental_date) AS 'Weekday',
CASE
WHEN (WEEKDAY(rental_date) >  4 ) then 'weekend'
ELSE 'workday'
END AS day_type
FROM sakila.rental;

SELECT *, DATE_FORMAT(rental_date,'%W') as weekday,
CASE
WHEN DATE_FORMAT(rental_date,'%W') = 'Monday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Tuesday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Wednesday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Thursday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Friday' then 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental;


-- 9. Get release years.
SELECT * FROM sakila.film;
SELECT DISTINCT(release_year) FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE'%ARMAGEDDON%';
 
-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE'%_APOLLO%';

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length ASC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(film_id)
FROM sakila.film
WHERE special_features LIKE '%Behind_the_Scenes%';


