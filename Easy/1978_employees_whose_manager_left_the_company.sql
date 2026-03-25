-- Problem: 1978. Employees Whose Manager Left the Company

-- Table:Employees
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | manager_id  | int      |
-- | salary      | int      |
-- +-------------+----------+

-- Description: Find employee IDs where salary < 30000 and their manager no longer exists in the Employees table.

-- Return results ordered by employee_id.

-- Solution:

SELECT EMPLOYEE_ID FROM EMPLOYEES
WHERE SALARY < 30000
AND MANAGER_ID NOT IN (
	SELECT EMPLOYEE_ID FROM EMPLOYEES
)
ORDER BY EMPLOYEE_ID