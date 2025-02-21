-- Problem: 577. Employee Bonus
-- Description:
-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

-- Return the result table in any order.
--
-- Tables:
-- Employee:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
--
-- Bonus:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+

-- Solution:

SELECT name, bonus
FROM Employee
    LEFT JOIN Bonus ON Bonus.empId = Employee.empId
WHERE
    bonus < 1000 OR bonus IS NULL;