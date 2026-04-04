-- Problem: 3482. Analyze Organization Hierarchy

-- Table: Employees
-- +----------------+---------+
-- | Column Name    | Type    | 
-- +----------------+---------+
-- | employee_id    | int     |
-- | employee_name  | varchar |
-- | manager_id     | int     |
-- | salary         | int     |
-- | department     | varchar |
-- +----------------+----------+

-- Description:
-- Analyze the organizational hierarchy to:

-- Assign each employee a level (CEO = 1, direct reports = 2, etc.).
-- Compute each manager’s total team size (all direct and indirect reports).
-- Calculate each manager’s salary budget (their salary + all reports’ salaries).

-- Return results ordered by level (ascending), budget (descending), then employee_name (ascending).

-- Solution:

WITH EmployeeHierarchy (EMPLOYEE_NAME, EMPLOYEE_ID, MANAGER_ID, LVL, SALARY) AS (
    SELECT EMPLOYEE_NAME,
           EMPLOYEE_ID,
           MANAGER_ID,
           1 AS LVL,
           SALARY
    FROM EMPLOYEES
    WHERE MANAGER_ID IS NULL

    UNION ALL

    SELECT e.EMPLOYEE_NAME,
           e.EMPLOYEE_ID,
           e.MANAGER_ID,
           eh.LVL + 1,
           e.SALARY
    FROM EMPLOYEES e
    INNER JOIN EmployeeHierarchy eh
        ON e.MANAGER_ID = eh.EMPLOYEE_ID
)
SELECT 
    eh.EMPLOYEE_ID,
    eh.EMPLOYEE_NAME,
    eh.LVL AS "LEVEL",
    COUNT(sub.EMPLOYEE_ID) - 1 AS "TEAM_SIZE",
    SUM(sub.SALARY) AS "BUDGET"
FROM EmployeeHierarchy eh
LEFT JOIN EmployeeHierarchy sub
    ON sub.EMPLOYEE_ID IN (
        SELECT EMPLOYEE_ID
        FROM EmployeeHierarchy
        START WITH EMPLOYEE_ID = eh.EMPLOYEE_ID
        CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
        AND EMPLOYEE_ID != eh.EMPLOYEE_ID
    )
GROUP BY eh.EMPLOYEE_NAME, eh.EMPLOYEE_ID, eh.LVL
ORDER BY eh.LVL ASC,"BUDGET" DESC,EMPLOYEE_NAME;