-- Problem: 181. Employees Earning More Than Their Managers
--
-- Description:
-- Write a solution to find the employees who earn more than their managers.
--
-- Return the result table in any order.
--
-- Tables:
-- Employee
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+

SELECT E.name AS Employee
FROM Employee AS E
LEFT JOIN Employee AS M 
ON E.managerId = M.id
WHERE E.salary > M.salary;