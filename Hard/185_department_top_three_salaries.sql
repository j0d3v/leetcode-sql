-- Problem: 185. Department Top Three Salaries
--
-- Description:
-- Write a solution to find the employees who are high earners in each of the departments.
--
-- Return the result table in any order.

-- Tables:
-- Employee
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
--
-- Department
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+

-- Solution:

SELECT T.Department, T.Employee, T.Salary
FROM (
    SELECT
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee AS E
    JOIN Department AS D ON D.id = E.departmentId
) AS T
WHERE salary_rank <= 3;
