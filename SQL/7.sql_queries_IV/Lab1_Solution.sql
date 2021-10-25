-- Lab | SQL - Lab 3.01
USE sakila;
-- Activity 1
-- 1. Drop column picture from staff.

ALTER TABLE sakila.staff
DROP COLUMN picture;

SELECT * FROM sakila.staff;


-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff
VALUES (3,'Tammy','Sanders', 5, 'tammy.sanders@sakilastaff.com', 1, 1, 'Tammy', 123456, '2006-02-15 03:56:12');

SELECT * FROM sakila.staff;

SELECT * FROM sakila.customer;
-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date 
-- for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you 
-- would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id 
-- information as well. To get that you can use the following query:

SELECT * FROM sakila.rental;

SELECT customer_id FROM sakila.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

SELECT * FROM sakila.film
WHERE title = 'Academy Dinosaur';

SELECT * FROM sakila.inventory
WHERE inventory_id = 1 ;

SELECT * FROM sakila.staff
WHERE staff_id = 1; 


INSERT INTO rental
VALUES (16060,'2005-05-24 23:33:42',1, 130, '2005-06-02 23:33:42', 1, '2006-06-02 23:33:42');

SELECT * FROM sakila.rental;

-- Use similar method to get inventory_id, film_id, and staff_id.