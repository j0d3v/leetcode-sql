-- Problem: 1327. List the Products Ordered in a Period

-- Description:
-- Write a solution to get the names of products that have at least 100 units
-- ordered in February 2020 and their amount.

-- Return the result table in any order.

-- Tables:
-- Products:
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | product_id       | int     |
-- | product_name     | varchar |
-- | product_category | varchar |
-- +------------------+---------+

-- Orders:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | order_date    | date    |
-- | unit          | int     |
-- +---------------+---------+

-- Solution:

SELECT product_name, SUM(unit) AS unit
FROM Products AS P
JOIN Orders AS O ON P.product_id = O.product_id
AND YEAR(order_date) = 2020
AND MONTH(order_date) = 2
GROUP BY product_name
HAVING SUM(unit) >= 100