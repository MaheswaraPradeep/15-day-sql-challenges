--WHERE IS USED TO GET A QUERY THAT SATISFIES A CONDITION
select *
from payment
where amount=10.99

-- first name and last name of customer with first name of adam
select first_name,last_name
from customer
where first_name='ADAM';

-- how many payments with amount=0
select count(*)
from payment
where amount=0;

--how many payment were made by customer with customer id=100
select count(*)
from payment
where customer_id=100;

--last name of customer with first name=erica
SELECT last_name
from customer
where first_name='ERICA';

--WHERE OPERATORS
--PAYMENTS GREATER THAN 10.99
SELECT *
FROM PAYMENT
WHERE AMOUNT>10.99
ORDER BY amount DESC;

SELECT *
FROM PAYMENT
WHERE AMOUNT!=10.99 --CAN ALSO USE<> INSTEAD OF !=
ORDER BY amount DESC;

--to check the not null values
SELECT first_name,last_name
from customer
where first_name is not null

--where operatos challenge
--The inventory manager asks you how rentals have
-- not been returned yet (return_date is null).
select count(*)
from rental
where return_date is null;

--The sales manager asks you how for a list of all the
-- payment_ids with an amount less than or equal to $2.
-- Include payment_id and the amount
select payment_id,amount
from payment
where amount<=2;

--WHERE WITH ANDOR
--AND
SELECT *
FROM payment
WHERE amount=10.99 AND customer_id=426
--OR
SELECT *
FROM PAYMENT
WHERE AMOUNT=10.99 OR AMOUNT=9.99

--in this case we will get amount=9.99 and id=426 or amount=10.99 because the and gets executed first
SELECT *
FROM payment
WHERE amount=10.99 or amount=9.99 and customer_id=426

--so we use bracket to get the or executed first
select *
from payment
where(amount=10.99 or amount=9.99) and customer_id=426;

select *
from payment
where (customer_id=30 or customer_id=31) and amount=2.99;

--ANDOR CHALLENGE
-- The suppcity manager asks you about a list of all the payment of
-- the customer 322, 346 and 354 where the amount is either less
-- than $2 or greater than $10.
-- It should be ordered by the customer first (ascending) and then
-- as second condition order by amount in a descending order.
SELECT *
FROM payment
WHERE
(customer_id=322 or customer_id=346 or customer_id=354)
and
(amount<2 or amount>10)
order by customer_id asc,amount desc;

--BETWEEN
select payment_id
from payment
where amount between 1.99 and 6.99 --the values 1.99 and 6.99 is also included

select payment_id,amount
from payment
where amount not between 1.99 and 6.99

--here the date  26 is not included since it is 00:00
select payment_id,payment_date
from payment
where payment_date between '2020-01-24' and '2020-01-26';

select *
from rental
where rental_date between '2005-05-24' and '2005-05-26'
order by rental_date desc

--BETWEEN CHALLENGE
-- How many payments have been made on January 26th and 27th
-- 2020 (including entire 27th) with an amount between 1.99 and 3.99? 
SELECT COUNT(*)
FROM PAYMENT
WHERE amount between 1.99 and 3.99 and payment_date between '2020-01-26' and '2020-01-28'; 

--IN OPERATOR
SELECT *
FROM CUSTOMER
WHERE CUSTOMER_ID IN (123,212,323,243,353,432)

--IN CHALLENGE
--customer_id: 12,25,67,93,124,234
-- The concerned payments are all the payments of these
-- customers with amounts 4.99, 7.99 and 9.99 in January 2020.
SELECT count(*)
FROM PAYMENT
WHERE CUSTOMER_ID IN (12,25,67,93,124,234) AND amount in (4.99,7.99,9.99) and payment_date between '2020-01-01' and '2020-01-31 23:59';

--LIKE OPERATOR
-- % REPRESENTS SEQUENCE OF CHARACTERS
SELECT * FROM ACTOR
WHERE first_name like 'A%'; --LIKE IS CASE SENSITIVE MEANS TRATS A and a differntly

SELECT * FROM ACTOR
WHERE first_name ilike 'A%' --now it is case insensitive

select * from actor
where first_name like '%A%';

select * from actor
where first_name NOT like '%A%';

--REPRESENTS SEQUENCE OF CHARACTERS
SELECT * FROM ACTOR
WHERE FIRST_NAME LIKE '_A%'; --THIS MEANS ONE SINGLE CHARACTER BEFORE A


SELECT * FROM FILM
WHERE description LIKE '%Drama%'
AND title like '_T%';

-- LIKE CHALLENGE
-- How many movies are there that contain the "Documentary" in
-- the description?
SELECT COUNT(*)
FROM FILM
WHERE DESCRIPTION LIKE '%Documentary%'

-- How many customers are there with a first name that is
-- 3 letters long and either an 'X' or a 'Y' as the last letter in the last
-- name?
select count(*)
from customer
where first_name like '___' AND (last_name like '%X' OR last_name like '%Y')

--ALIASES change the column name in data output
select description as description_of_movie
from film