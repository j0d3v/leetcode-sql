-- Problem: 180. Consecutive Numbers
--
-- Description:
-- Find all numbers that appear at least three times consecutively.
--
-- Return the result table in any order.
--
-- Table Schema:
-- Logs:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+

-- Solution:
SELECT DISTINCT
    L1.Num AS ConsecutiveNums
FROM Logs L1, Logs L2, Logs L3
WHERE
    L1.Num = L2.Num
    AND L2.num = L3.Num
    AND L1.id + 1 = L2.id
    AND L2.id + 1 = L3.id;