-- Problem: 183. Customers Who Never Order
--
-- Description:
-- Write a solution to find all customers who never order anything.

-- Return the result table in any order.

-- Tables:
-- Customers:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+

-- Orders:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+

-- Solution:

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
	SELECT customerId FROM Orders
);