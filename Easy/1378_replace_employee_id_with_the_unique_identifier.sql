-- Problem: 1378. Replace Employee ID With The Unique Identifier

-- Description:
-- Write a solution to show the unique ID of each user,
-- If a user does not have a unique ID replace just show null.

-- Return the result table in any order.

-- Tables:
-- Employees:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+

-- EmployeeUNI:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | unique_id     | int     |
-- +---------------+---------+

-- Solution:

SELECT unique_id,name FROM Employees
LEFT JOIN EmployeeUNI USING(id);
