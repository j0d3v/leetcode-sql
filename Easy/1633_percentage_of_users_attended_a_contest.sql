-- Problem: 1633. Percentage of Users Attended a Contest

-- Description:
-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

-- Return the result table ordered by percentage in descending order.
-- In case of a tie, order it by contest_id in ascending order.

-- Tables:
-- Users:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | user_name   | varchar |
-- +-------------+---------+

-- Register:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | contest_id  | int     |
-- | user_id     | int     |
-- +-------------+---------+

-- Solution:

SELECT contest_id,
       ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS "percentage"
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;