-- Problem: 197. Rising Temperature
-- Description:
-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
--
-- Return the result table in any order.
--
-- Tables:
-- Weather:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+

-- Solution:

SELECT W2.id
FROM Weather AS W1, Weather AS W2
WHERE DATEDIFF(W2.recordDate, W1.recordDate) = 1
AND W1.temperature < W2.temperature;