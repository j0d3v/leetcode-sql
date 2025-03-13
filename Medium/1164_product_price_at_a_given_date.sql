-- Problem: 1164. Product Price at a Given Date

-- Description:
-- Write a solution to find the prices of all products on 2019-08-16.
-- Assume the price of all products before any change is 10.

-- Return the result table in any order.

-- Tables:
-- Products:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+

-- Solution:

SELECT 
    P1.product_id,
    COALESCE(MAX(P2.new_price), 10) AS price
FROM Products AS P1
LEFT JOIN Products AS P2
ON P1.product_id = P2.product_id
AND P2.change_date = (
    SELECT MAX(change_date)
    FROM Products
    WHERE product_id = P2.product_id
    AND change_date <= '2019-08-16'
)
GROUP BY P1.product_id;
