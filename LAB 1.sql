## LAB 1 

# 1 Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

# 2 How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(inventory_id) FROM inventory;
SELECT COUNT(DISTINCT(inventory_id)) FROM rental;

# 3 What are the shortest and longest movie duration? 
#Name the values max_duration and min_duration.

select min(length) as min_duration, max(length) as max_duration
from sakila.film;

# 4 What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(TIME(length)))) AS avg_duration
FROM sakila.film;


# 5 How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS unique_last_names
FROM actor;


# 6 Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(NOW(), min(rental_date)) AS days_op from sakila.rental;


# 7 Show rental info with additional columns month and weekday. Get 20 results.

SELECT rental_id,date_format(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday
from rental
limit 20;

# 8 Add an additional column day_type with values 'weekend' and 'workday' 
#depending on the rental day of the week.
SELECT rental_id, rental_date,
       CASE DAYOFWEEK(rental_date)
           WHEN 1 THEN 'weekend'
           WHEN 7 THEN 'weekend'
           ELSE 'workday'
       END AS day_type
FROM rental
LIMIT 20;


# 9 Get release years.
SELECT release_year from film;

# 10 Get all films with ARMAGEDDON in the title.
SELECT * from film where title like '%ARMAGEDDON%';


#11 Get all films which title ends with APOLLO.

SELECT * from sakila.film
where title like '%APOLLO';

# 12 Get 10 the longest films.

SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;


# 13 How many films include Behind the Scenes content?
SELECT COUNT(*) AS total_films_BS
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
