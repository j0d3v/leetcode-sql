-- Problem: 1204. Last Person to Fit in the Bus

-- Description:
-- Write a solution to find the person_name of the last person that can fit on the bus
-- without exceeding the weight limit.
-- The test cases are generated such that the first person does not exceed the weight limit.

-- Note that only one person can board the bus at any given turn.

-- Tables:
-- Queue:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |
-- | person_name | varchar |
-- | weight      | int     |
-- | turn        | int     |
-- +-------------+---------+

-- Solution:

SELECT person_name
FROM (
    SELECT person_name, 
           SUM(weight) OVER (ORDER BY turn) AS total
    FROM Queue
) AS t
WHERE t.total <= 1000
ORDER BY t.total DESC
LIMIT 1;