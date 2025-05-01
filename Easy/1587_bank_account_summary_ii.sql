-- Problem: 1587. Bank Account Summary II

-- Description:
-- Write a solution to report the name and balance of users with a balance higher than 10000.
-- The balance of an account is equal to the sum of the amounts of all transactions involving that account.

-- Return the result table in any order.

-- Tables:
-- Users:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | account      | int     |
-- | name         | varchar |
-- +--------------+---------+

-- Transactions
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | trans_id      | int     |
-- | account       | int     |
-- | amount        | int     |
-- | transacted_on | date    |
-- +---------------+---------+

-- Solution:

SELECT name, SUM(amount) AS "balance"
FROM Users
JOIN Transactions USING (account)
GROUP BY name
HAVING SUM(amount) > 10000