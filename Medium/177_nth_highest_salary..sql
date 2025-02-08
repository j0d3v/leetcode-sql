-- Problem: 177. Nth Highest Salary
-- Description:
-- Write a solution to find the nth highest salary from the Employee table.
-- If there is no nth highest salary, return null.

-- Tables:
-- Employee:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
DETERMINISTIC
BEGIN
    SET N = N - 1;

    IF N < 0 THEN
        RETURN NULL;
    END IF;

    RETURN (
        SELECT DISTINCT salary 
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END;