-- Problem: 610. Triangle Judgement
-- Description:
-- Report for every three line segments whether they can form a triangle.

-- Return the result table in any order.

-- Tables:
-- Triangle:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+

-- Solution:

SELECT *, 
       CASE 
           WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM Triangle;