-- Problem: 176. Second Highest Salary
-- Description:
-- Write an SQL query to find the second highest distinct salary from the Employee table.
-- If there is no second highest salary, return NULL.

-- Tables:
-- Employee:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+

SELECT IFNULL(
    (
        SELECT salary
        FROM Employee
        WHERE salary < (
            SELECT MAX(salary) 
            FROM Employee
        )
        ORDER BY salary DESC
        LIMIT 1
    ), 
    NULL
) AS SecondHighestSalary;
