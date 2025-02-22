-- Problem: 584. Find Customer Referee
-- Description:
-- Find the names of the customer that are not referred by the customer with id = 2.

-- Return the result table in any order.

-- Tables:
-- Customer:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | referee_id  | int     |
-- +-------------+---------+

-- Solution:

SELECT name FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;