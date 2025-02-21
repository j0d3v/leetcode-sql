-- Problem: 570. Managers with at Least 5 Direct Reports
-- Description:
-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.

-- Tables:
-- Employee:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+

-- Solution:

SELECT name FROM Employee
WHERE id IN (
SELECT managerId  FROM Employee
GROUP BY managerId
HAVING COUNT(id) >= 5
);
