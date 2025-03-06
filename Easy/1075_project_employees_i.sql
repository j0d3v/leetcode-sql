-- Problem: 1075. Project Employees I

-- Description:
-- Write an SQL query that reports the average experience years of all the employees for each project,
-- rounded to 2 digits.

-- Return the result table in any order.

-- Tables:
-- Project:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
--
-- Employee:
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+

-- Solution:

SELECT P.project_id, ROUND(AVG(E.experience_years), 2) AS average_years
FROM Employee AS E
RIGHT JOIN `Project` AS P ON P.employee_id = E.employee_id
GROUP BY P.project_id;