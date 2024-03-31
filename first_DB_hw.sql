-- 1. How many actors are there with the last name ‘Wahlberg’?
select last_name, count(*) as c
from actor a 
group by last_name
order by last_name desc;
-- 2

--2. How many payments were made between $3.99 and $5.99?
select amount, count(amount)
from payment p 
where amount >= 3.99 and amount <= 5.99
group by amount
order by amount asc;
-- 5602

--3. What film does the store have the most of? (search in inventory)
select film_id, count(film_id)
from inventory i
group by film_id
order by count desc;
-- highest count in inventory is 8, but many films have that number rather than only one.

--4. How many customers have the last name ‘William’?
select first_name, last_name
from customer 
where last_name = 'William'
-- output: None

--5. What store employee (get the id) sold the most rentals?
select staff_id, count(staff_id)
from rental r 
group by staff_id
order by count desc;
-- staff_id 1

--6. How many different district names are there?
select count(distinct district) as count_dist
from address a;
--378

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id)
from film_actor fa
group by film_id
order by count desc;
-- film_id 508

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select last_name, store_id
from customer c 
where last_name like '%es' and store_id = 1;
--13

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--   with ids between 380 and 430? (use group by and having > 250)
select amount, count(amount), customer_id 
from payment p 
where customer_id > 380 and amount < 430
group by amount, customer_id
having amount > 250;
-- output: None

--10. Within the film table, how many rating categories are there? And what rating has the most
--    movies total?
select rating, count(rating)
from film f
group by rating
order by count desc;
--5 categories, PG-13 has most movies total
