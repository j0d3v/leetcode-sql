-- Problem: Find Each Employee's Primary Department

-- Description:
-- The Employee table shows which departments an employee belongs to,
-- with a primary_flag indicating their main department ('Y' for primary, 'N' otherwise).
-- Employees can belong to multiple departments; if only one, primary_flag is 'N'.

-- Write a solution to return each employee with their primary department.
-- If an employee belongs to only one department, return that department.

-- Tables:
-- Employee:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | employee_id   | int     |
-- | department_id | int     |
-- | primary_flag  | varchar |
-- +---------------+---------+
-- (employee_id, department_id) is the primary key.

-- Solution:

SELECT employee_id, department_id
FROM EMPLOYEE
WHERE primary_flag = 'Y'
OR employee_id IN (
    SELECT employee_id
    FROM EMPLOYEE
    GROUP BY employee_id
    HAVING COUNT(department_id) = 1
)