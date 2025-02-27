-- Problem: 607. Sales Person
-- Description:
-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

-- Return the result table in any order.

-- Tables:
-- SalesPerson:
--+-----------------+---------+
--| Column Name     | Type    |
--+-----------------+---------+
--| sales_id        | int     |
--| name            | varchar |
--| salary          | int     |
--| commission_rate | int     |
--| hire_date       | date    |
--+-----------------+---------+

-- Company:
--+-------------+---------+
--| Column Name | Type    |
--+-------------+---------+
--| com_id      | int     |
--| name        | varchar |
--| city        | varchar |
--+-------------+---------+

-- Orders:
--+-------------+------+
--| Column Name | Type |
--+-------------+------+
--| order_id    | int  |
--| order_date  | date |
--| com_id      | int  |
--| sales_id    | int  |
--| amount      | int  |
--+-------------+------+

-- Solution:

SELECT name FROM SalesPerson
WHERE sales_id NOT IN (
	SELECT sales_id FROM Orders AS O
	JOIN Company AS C
	ON C.com_id = O.com_id
	AND C.name = "RED"
);
