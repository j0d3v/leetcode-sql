-- Problem: 1068. Product Sales Analysis I

-- Description:
-- Write a solution to report the product_name, year,
-- and price for each sale_id in the Sales table.

-- Return the result table in any order.

-- Tables:
-- Sales:
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+

-- Product:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+

-- Solution:

SELECT P.product_name, S.year, S.price
FROM Sales AS S
JOIN Product AS P
ON S.product_id = P.product_id;