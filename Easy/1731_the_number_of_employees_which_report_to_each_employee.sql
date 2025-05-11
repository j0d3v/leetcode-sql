-- Problem: 1731. The Number of Employees Which Report to Each Employee

-- Description:
-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

-- Write a solution to report the ids and the names of all managers,
-- the number of employees who report directly to them,
-- and the average age of the reports rounded to the nearest integer.

-- Return the result table ordered by employee_id.

-- Tables:
-- Employees:
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | reports_to  | int      |
-- | age         | int      |
-- +-------------+----------+

-- Solution:

SELECT 
    M.employee_id, 
    M.name, 
    COUNT(E.employee_id) AS reports_count, 
    ROUND(AVG(E.age)) AS average_age
FROM Employees M
JOIN Employees E ON M.employee_id = E.reports_to
GROUP BY M.employee_id, M.name
ORDER BY M.employee_id