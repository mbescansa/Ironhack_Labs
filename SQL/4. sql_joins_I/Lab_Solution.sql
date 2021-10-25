-- Lab | SQL Join (Part I)
USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.category;

SELECT c.name as genre_name, COUNT(*)
FROM sakila.film_category fc
JOIN sakila.category c
USING (category_id)
GROUP BY c.category_id;


-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.payment;

SELECT SUM(amount) AS Sum_sales, staff_id 
FROM sakila.payment p
WHERE p.payment_date BETWEEN '2005-08-01 00:00:00' AND '2005-08-31 00:00:00'
GROUP BY p.staff_id;

SELECT SUM(amount), staff_id
FROM sakila.payment p
WHERE DATE(payment_date) BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT actor_id, COUNT(film_id) AS number_of_films
FROM sakila.film_actor
GROUP BY actor_id
ORDER BY number_of_films DESC
LIMIT 1;


-- 4. Most active customer (the customer that has rented the most number of films).
SELECT customer_id, COUNT(rental_id) AS number_of_rentals
FROM sakila.rental
GROUP BY customer_id
ORDER BY number_of_rentals DESC
LIMIT 1;


-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT fc.first_name, fc.last_name, c.address 
FROM sakila.staff fc
JOIN sakila.address c
USING (address_id);


-- 6. List each film and the number of actors who are listed for that film.
SELECT fa.film_id, f.title, COUNT(fa.actor_id) AS number_of_actors
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
GROUP BY fa.film_id
ORDER BY number_of_actors DESC;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM sakila.payment p
JOIN sakila.customer c
USING (customer_id)
GROUP BY p.customer_id
ORDER BY c.last_name ASC;


-- 8. List number of films per category.
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.category;

SELECT c.name as genre_name, COUNT(*)
FROM sakila.film_category fc
JOIN sakila.category c
USING (category_id)
GROUP BY c.category_id;



