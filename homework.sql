-- Week 5 - Wednesday Questions

-- 1. List all customers who live in Texas (use JOINs)

SELECT customer.first_name, customer.last_name, address.district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as full_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as full_name
FROM customer
WHERE customer_id IN (
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175);

-- 4. List all customers that live in Nepal (use the city table)

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as full_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?

SELECT CONCAT(staff.first_name, ' ', staff.last_name) as full_name, COUNT(rental_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY full_name
ORDER BY COUNT(rental_id) DESC;

-- 6. How many movies of each rating are there?

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as full_name, amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 8. How many free rentals did our stores give away?

SELECT COUNT(rental_id)
FROM store
JOIN staff
ON store.store_id = staff.store_id
JOIN payment
ON staff.staff_id = payment.staff_id
WHERE amount = 0;