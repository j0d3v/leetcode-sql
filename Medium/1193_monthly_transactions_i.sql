-- Problem: 1193. Monthly Transactions I

-- Description:
-- Write an SQL query to find for each month and country,
-- the number of transactions and their total amount,
-- the number of approved transactions and their total amount.

--Return the result table in any order.

-- Tables:
-- Transactions:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+

-- Solution:
SELECT
    DATE_FORMAT(trans_date, "%Y-%m") AS month,
    country,
    COUNT(state) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country 