select distinct district
from address

select rental_date
from rental
order by rental_date desc
limit 1;

select count(*)
from film;

select count(distinct last_name)
from customer;