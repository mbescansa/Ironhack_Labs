-- Lab | SQL Join (Part II)

USE sakila;

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, ci.city, co.country
FROM sakila.store s
JOIN sakila.address a 
USING (address_id)
JOIN sakila.city ci
USING (city_id)
JOIN sakila.country co
USING (country_id)
GROUP BY store_id;


-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id, SUM(p.amount) AS total_business
FROM sakila.staff s
JOIN sakila.payment p
USING (staff_id)
GROUP BY s.store_id
ORDER BY total_business DESC;


-- 3. Which film categories are longest?
SELECT c.name, SUM(f.length) AS total_duration
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
JOIN sakila.category c
USING (category_id)
GROUP BY fc.category_id
ORDER BY total_duration DESC;

SELECT MAX(f.length) as longest, c.name
FROM sakila.category as c
JOIN sakila.film_category as fc
USING (category_id)
JOIN sakila.film as f
USING (film_id)
GROUP BY c.name
ORDER BY c.name DESC;


-- 4. Display the most frequently rented movies in descending order.
-- rental - inventory_id, rental_id
-- inventory - inventory_id, film_id
-- film - film_id, title

SELECT COUNT(f.film_id) AS frequency_rent, f.title
FROM sakila.rental r
JOIN sakila.inventory i
USING (inventory_id)
JOIN sakila.film f
USING (film_id)
GROUP BY f.title
ORDER BY frequency_rent DESC;


-- 5. List the top five genres in gross revenue in descending order.
-- category - category_id, name
-- film_category - category_id, film_id
-- inventory - film_id, inventory_id
-- rental - inventory_id, customer_id
-- payment - customer_id, amount

SELECT c.name, SUM(p.amount) AS gross_revenue
FROM sakila.category c
JOIN sakila.film_category fc
USING (category_id)
JOIN sakila.inventory i
USING (film_id)
JOIN sakila.rental r
USING (inventory_id)
JOIN sakila.payment p
USING (rental_id)
GROUP BY c.name
ORDER BY gross_revenue DESC;


-- 6. Is "Academy Dinosaur" available for rent from Store 1?
-- rental - inventory_id, return_date, 
-- inventory - inventory_id, film_id, store_id
-- film - film_id, title

SELECT f.title, COUNT(r.return_date IS NULL) AS not_available, COUNT(r.return_date IS NOT NULL) AS available, i.store_id
FROM sakila.rental r
JOIN sakila.inventory i
USING (inventory_id)
JOIN sakila.film f
USING (film_id)
WHERE f.title = 'Academy Dinosaur' AND i.store_id=1;

SELECT store_id, f.title, COUNT(store_id) AS Num_film
FROM store
JOIN sakila.inventory i
USING (store_id)
JOIN sakila.film f
USING(film_id)
GROUP BY f.title, store_id
HAVING f.title = 'Academy Dinosaur';

SELECT f.title, i.store_id, r.return_date
FROM sakila.rental r
JOIN sakila.inventory i
USING (inventory_id)
JOIN sakila.film f
USING (film_id)
WHERE f.title = 'Academy Dinosaur' AND i.store_id=1;



-- 7. Get all pairs of actors that worked together.
-- film_actor  -- actor_id, film_id -- IMPOSSIBLE
SELECT a1.film_id, a2.film_id, a1.actor_id 
FROM sakila.actor_id a1
JOIN sakila.actor_id a2
ON a1.film_id = a2.film_id AND (a1.film_id <> a2.film_id)
ORDER BY a1.actor_id ASC;

-- 8. Get all pairs of customers that have rented the same film more than 3 times.



-- 9. For each film, list actor that has acted in more films.
SELECT CONCAT(a.first_name,' ', a.last_name) AS Actor, COUNT(film_id) AS Num_films
FROM film
JOIN sakila.film_actor fa
USING(film_id)
JOIN sakila.actor a
USING (actor_id)
GROUP BY actor_id
ORDER BY Num_films DESC
LIMIT 1;
