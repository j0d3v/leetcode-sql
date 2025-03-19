-- Problem: 1251. Average Selling Price

-- Description:
-- Write a solution to find the average selling price for each product.
-- average_price should be rounded to 2 decimal places.
-- If a product does not have any sold units, its average selling price is assumed to be 0.

-- Return the result table in any order.

-- Tables:
-- Prices:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | start_date    | date    |
-- | end_date      | date    |
-- | price         | int     |
-- +---------------+---------+

-- UnitsSold:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | purchase_date | date    |
-- | units         | int     |
-- +---------------+---------+

-- Solution:

SELECT P.product_id, ROUND(
        SUM(P.price * IFNULL(units, 0)) / IFNULL(SUM(units), 1), 2
    ) AS average_price
FROM Prices AS P
LEFT JOIN UnitsSold AS U
ON P.product_id = U.product_id
AND purchase_date BETWEEN start_date AND end_date
GROUP BY P.product_id