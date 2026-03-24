-- Problem: 1965. Employees With Missing Information

-- Tables: Employees
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | employee_id | int     |
-- | name        | varchar |
-- +-------------+---------+

-- Table: Salaries
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | employee_id | int     |
-- | salary      | int     |
-- +-------------+---------+

-- Description: Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:

-- The employee's name is missing, or
-- The employee's salary is missing.

--Return the result table ordered by employee_id in ascending order.

-- Solution:

SELECT employee_id FROM Employees
UNION SELECT employee_id FROM Salaries
MINUS (
	SELECT E.employee_id
	FROM Employees E
	INNER JOIN Salaries S
    ON E.employee_id = S.employee_id
)
ORDER BY employee_id ASC