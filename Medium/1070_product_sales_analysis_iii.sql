-- Problem: 1070. Product Sales Analysis III

-- Description:
-- Write a solution to select the product id, year, quantity,
-- and price for the first year of every product sold.

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

SELECT S1.product_id, S1.first_year, 
       S2.quantity, S2.price  
FROM (  
    SELECT product_id, MIN(year) AS first_year  
    FROM Sales  
    GROUP BY product_id  
) S1  
JOIN Sales S2  
ON S2.product_id = S1.product_id  
AND S2.year = S1.first_year;
