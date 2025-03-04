-- Problem: 1045. Customers Who Bought All Products

-- Description:
-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

-- Return the result table in any order.

-- Table Schema:
-- Customer:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |
-- | product_key | int     |
-- +-------------+---------+

-- Product:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |
-- +-------------+---------+

-- Solution:

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(DISTINCT product_key) 
    FROM Product
);