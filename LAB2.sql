## LAB 2 
use sakila;
##1
SELECT DISTINCT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

##2
SELECT DISTINCT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

## 3 find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(*) as total_rentals
FROM rental
GROUP BY staff_id;

## 4 Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(*) AS total_films
FROM film
GROUP BY release_year; 


## 5 Number of films for each rating:
SELECT * from film;

select rating , count(*) as total_films 
from film
group by rating;

### 6 Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating;

## 7 Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating
HAVING avg_length>120;

## 8 
SELECT title, length, RANK() OVER (ORDER BY length) AS movie_rank
FROM film
WHERE length >0;


