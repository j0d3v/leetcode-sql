-- Problem: 627. Swap Salary


-- Description:
-- Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa)
-- with a single update statement and no intermediate temporary tables.

-- Note that you must write a single update statement,
-- do not write any select statement for this problem.

-- Tables:
-- Salary:
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | id          | int      |
-- | name        | varchar  |
-- | sex         | ENUM     |
-- | salary      | int      |
-- +-------------+----------+

-- Solution:

UPDATE Salary 
SET sex = CASE 
    WHEN sex = 'm' THEN 'f' 
    ELSE 'm' 
END;