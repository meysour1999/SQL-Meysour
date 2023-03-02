use sakila;

-- LAB 1 


##1 


SELECT category_id AS category_name, COUNT(film.film_id) AS film_count
FROM film
JOIN film_category 
ON film.film_id = film_category.film_id
GROUP BY category_id;

##2 
SELECT staff.staff_id,first_name, SUM(payment.amount) AS total_amount
FROM staff
JOIN payment 
ON staff.staff_id = payment.staff_id
WHERE payment.payment_date >= '2005-08-01' AND payment.payment_date <= '2005-08-31'
GROUP BY staff.staff_id;

##3 

SELECT film_actor.actor_id,count(film_actor.film_id) as film_count
from film_actor
join film
on film.film_id=film_actor.film_id
group by film_actor.actor_id;

##4 

SELECT concat(customer.first_name, ' ',customer.last_name) as customer_name, count(rental.customer_id) as total_rental
from customer 
join rental
on customer.customer_id=rental.customer_id
group by customer_name;

##5
SELECT CONCAT(staff.first_name, ' ', staff.last_name) AS staff_name, address.address
FROM staff
JOIN address ON staff.address_id = address.address_id;

##6
SELECT film.film_id,film.title,count(film_actor.actor_id) as actor_count
from film
join film_actor
on film.film_id=film_actor.film_id
group by film.film_id,film.title;

##7 

SELECT customer.last_name, sum(payment.amount) as total_paid
from payment
join customer
on payment.customer_id = customer.customer_id
group by customer.last_name;

##8 
SELECT name as movie_type,count(film_category.film_id) as number_of_films
from category
join film_category 
on category.category_id=film_category.category_id
group by name;

-- LAB 2 

#1
SELECT * from city;
Select * from country;
SELECT * from store ;

SELECT store.store_id, city.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

#2

SELECT store.store_id, SUM(payment.amount) as total_sales
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;


#3

SELECT category.name as category_name, AVG(film.length) as avg_length
FROM film_category
INNER JOIN category ON film_category.category_id = category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY avg_length DESC;




#4

SELECT film.title, COUNT(rental.rental_id) as rental_count
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC;





#5

SELECT category.name, sum(payment.amount) as total_rev
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film_category ON film_category.film_id = inventory.film_id
JOIN category on category.category_id = film_category.category_id
group by category.name;






#6
SELECT DISTINCT film.title, store.store_id 
FROM film
JOIN inventory ON inventory.film_id = film.film_id
JOIN store ON store.store_id = inventory.store_id
where store.store_id = '1' and film.title='Academy Dinosaur';



#7

#with names 

SELECT concat(b1.first_name,' ',b1.last_name) as actor_name,b1.actor_id, concat(b2.first_name,' ',b2.last_name) as actor_name2,b2.actor_id, a1.film_id
FROM actor b1
JOIN actor b2 on b1.actor_id != b2.actor_id 
JOIN film_actor a1 ON a1.actor_id = b2.actor_id
JOIN film_actor a2 ON (a1.actor_id > a2.actor_id) AND (a1.film_id = a2.film_id)
ORDER BY a1.film_id;   -- thanks to ERIN and GIANCARLO for the help 

#without_names

SELECT a1.actor_id, a2.actor_id, a1.film_id
FROM film_actor a1
JOIN film_actor a2
ON (a1.actor_id <> a2.actor_id) AND (a1.film_id = a2.film_id)
ORDER BY a1.film_id;

#8
-- for monday 

#9
-- for monday 