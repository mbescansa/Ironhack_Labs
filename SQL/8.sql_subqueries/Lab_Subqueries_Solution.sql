-- Lab | SQL Subqueries 3.03

USE sakila;

-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT COUNT(film_id) FROM inventory
WHERE film_id IN (
	SELECT film_id FROM film 
	WHERE title = 'Hunchback Impossible');


-- another way 
SELECT COUNT(*) FROM inventory
WHERE film_id IN (
	SELECT film_id FROM (
		SELECT title, film_id FROM film
		WHERE title LIKE 'Hunchback Impossible') sub1);


-- another way
SELECT Amount_of_copies
FROM (
	SELECT film_id, COUNT(inventory_id) AS Amount_of_copies
	FROM inventory
	GROUP BY film_id
	HAVING film_id = (
		SELECT film_id
		FROM film
		WHERE title = 'Hunchback Impossible'))sub2;


-- 2. List all films whose length is longer than the average of all the films.
SELECT title, length FROM sakila.film
WHERE length > (
  SELECT avg(length)
  FROM sakila.film);


-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name FROM actor
WHERE actor_id IN (
		SELECT actor_id FROM film_actor
		WHERE film_id IN (
			SELECT film_id FROM film
			WHERE title LIKE 'Alone Trip'));


-- another way
SELECT first_name, last_name, actor_id FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM (
		SELECT actor_id, film_id FROM film_actor
		WHERE film_id IN (
			SELECT film_id FROM (
				SELECT film_id, title FROM film
					WHERE title LIKE "Alone Trip")sub1))sub2);
    
    
-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title, film_id FROM film
WHERE film_id IN (
	SELECT film_id FROM (
		SELECT category_id FROM film_category
		WHERE category_id IN (
			SELECT category_id FROM category
            WHERE name LIKE 'Family'))sub1);


-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT first_name, last_name, email, address_id FROM customer
WHERE address_id IN (
	SELECT address_id FROM (
		SELECT city_id FROM city
		WHERE country_id IN (
			SELECT country_id FROM country
            WHERE country LIKE 'Canada'))sub1);


-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT title, film_id FROM film
WHERE film_id IN (
	SELECT film_id FROM (
		SELECT  film_id FROM film_actor 
		WHERE actor_id = (
			SELECT actor_id FROM film_actor
			GROUP BY actor_id
			ORDER BY COUNT(film_id) DESC
			LIMIT 1))sub);


-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
SELECT title FROM film
WHERE film_id IN (
	SELECT film_id FROM inventory
	WHERE inventory_id IN (
		SELECT inventory_id FROM rental
		WHERE customer_id = ( 
			SELECT customer_id FROM payment
			GROUP BY customer_id
			ORDER BY sum(amount) DESC
			LIMIT 1)));
                       
            
-- 8. Customers who spent more than the average payments.
SELECT first_name, last_name FROM customer
WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment
	WHERE amount > (
		SELECT AVG(amount)
		FROM payment));