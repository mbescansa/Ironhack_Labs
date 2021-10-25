USE sakila;

-- Answer question 1
SHOW FULL TABLES;

-- Answer question 2
SHOW COLUMNS FROM film;

-- Answer question 3
SELECT title FROM film;

-- Answer question 4
SELECT name AS languages
FROM language;

-- Answer question 5
SELECT * FROM staff;
SELECT first_name FROM staff;

-- Answer question 6
SELECT DISTINCT rental_date
FROM rental;

-- SELECT CAST(rental_date AS DATE) FROM rental;
SELECT COUNT(DISTINCT CAST(rental_date AS DATE))
FROM   rental
WHERE  rental_date >= '20050501' AND rental_date < '20050531' ;



 