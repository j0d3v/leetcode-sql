-- Problem: 1581. Customer Who Visited but Did Not Make Any Transactions

-- Description:
-- Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

-- Return the result table sorted in any order.

-- Tables:
-- Visits:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | visit_id    | int     |
-- | customer_id | int     |
-- +-------------+---------+

-- Transactions:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | transaction_id | int     |
-- | visit_id       | int     |
-- | amount         | int     |
-- +----------------+---------+

-- Solution:

SELECT customer_id, COUNT(visit_id) AS "count_no_trans"
FROM Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id