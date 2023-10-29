--CHALLENGES DAY 2
-- How many movies are there that contain 'Saga'
-- in the description and where the title starts either
-- with 'A' or ends with 'R'?
-- Use the alias 'no_of_movies'.

SELECT COUNT(*) AS no_of_movies
FROM FILM
WHERE description LIKE '%Saga%' and (title like 'A%' OR TITLE LIKE '%R');

-- Create a list of all customers where the first name contains
-- 'ER' and has an 'A' as the second letter.
-- Order the results by the last name descendingly
SELECT *
FROM CUSTOMER
WHERE first_name LIKE '%ER%' and first_name like '_A%'
ORDER BY last_name desc

-- How many payments are there where the amount is either 0
-- or is between 3.99 and 7.99 and in the same time has
-- happened on 2020-05-01.
SELECT
COUNT(*)
FROM payment
WHERE (amount = 0
OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02'
