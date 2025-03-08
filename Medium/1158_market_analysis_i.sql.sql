-- Problem: 1158. Market Analysis I

-- Description:
-- Write a solution to find for each user, the join date and the number 
-- of orders they made as a buyer in 2019.

-- Return the result table in any order.

-- Tables:
-- Users:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | join_date      | date    |
-- | favorite_brand | varchar |
-- +----------------+---------+

-- Orders:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | order_date    | date    |
-- | item_id       | int     |
-- | buyer_id      | int     |
-- | seller_id     | int     |
-- +---------------+---------+

-- Items:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | item_id       | int     |
-- | item_brand    | varchar |
-- +---------------+---------+

-- Solution:

SELECT user_id AS buyer_id, join_date, 
       COUNT(O.order_id) AS orders_in_2019
FROM Users AS U
LEFT JOIN Orders AS O
ON O.buyer_id = U.user_id
AND YEAR(O.order_date) = "2019"
GROUP BY user_id,join_date
ORDER BY user_id ASC;
