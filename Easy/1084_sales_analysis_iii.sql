-- Problem: 1084. Sales Analysis III

-- Description:
-- Write a solution to report the products that were only sold in the first quarter of 2019.
-- That is, between 2019-01-01 and 2019-03-31 inclusive.

-- Return the result table in any order.

-- Tables:
-- Product:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- | unit_price   | int     |
-- +--------------+---------+

-- Sales:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | seller_id   | int     |
-- | product_id  | int     |
-- | buyer_id    | int     |
-- | sale_date   | date    |
-- | quantity    | int     |
-- | price       | int     |
-- +-------------+---------+

-- Solution:

SELECT P.product_id, P.product_name
FROM Product P
JOIN Sales S ON P.product_id = S.product_id
GROUP BY P.product_id, P.product_name
HAVING  MIN(S.sale_date) >= '2019-01-01' 
AND MAX(S.sale_date) <= '2019-03-31';