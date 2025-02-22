-- Problem: 586. Customer Placing the Largest Number of Orders
-- Description:
-- Write a solution to find the customer_number for the customer who has placed the largest number of orders.

-- Tables:
-- Orders
-- +-----------------+----------+
-- | Column Name     | Type     |
-- +-----------------+----------+
-- | order_number    | int      |
-- | customer_number | int      |
-- +-----------------+----------+

-- Solution:

SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;