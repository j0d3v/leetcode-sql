-- Problem: 1174. Immediate Food Delivery II

-- Description:
-- Write a solution to find the percentage of immediate orders in the first orders of all customers,
-- rounded to 2 decimal places.

-- Tables:
-- Delivery:
-- +-----------------------------+---------+
-- | Column Name                 | Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+

-- Solution:
SELECT ROUND(COUNT(*)*100/(SELECT COUNT(DISTINCT customer_id) FROM Delivery),2)
AS immediate_percentage
FROM(
SELECT customer_id FROM Delivery
GROUP BY customer_id
HAVING MIN(order_date) = MIN(customer_pref_delivery_date)
) AS first_orders