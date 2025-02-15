-- Problem: 184. Department Highest Salary
--
-- Description:
-- Write a solution to find employees who have the highest salary in each of the departments.
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

-- Method 1: (Faster)

SELECT 
    D.name AS Department,
    E.name AS Employee,
    E.salary
FROM Employee E
JOIN Department D 
ON D.id = E.departmentId
JOIN (
    SELECT departmentId, MAX(salary) AS max_salary
    FROM Employee
    GROUP BY departmentId
) R 
ON E.departmentId = R.departmentId 
AND E.salary = R.max_salary;

-- Method 2:

SELECT 
    D.name AS Department,
    E.name AS Employee,
    E.salary
FROM Employee E
JOIN Department D
ON D.id = E.departmentId
WHERE E.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = D.id
);
