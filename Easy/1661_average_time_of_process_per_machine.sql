-- Problem: 1661. Average Time of Process per Machine

-- Description:
-- A factory website has multiple machines, each running the same number of processes.

-- Write a solution to find the average time each machine takes to complete a process.

-- Return a table with machine_id and average processing_time (rounded to 3 decimal places).  

-- The result can be in any order.

-- Tables:
-- Activity:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | machine_id     | int     |
-- | process_id     | int     |
-- | activity_type  | enum    |
-- | timestamp      | float   |
-- +----------------+---------+

-- Solution:

WITH ProcessTimes AS (
  SELECT 
    machine_id, 
    SUM(CASE 
          WHEN activity_type = 'end' THEN timestamp 
          ELSE -timestamp 
        END) AS total_time
  FROM Activity
  GROUP BY machine_id, process_id
)
SELECT 
  machine_id, 
  ROUND(AVG(total_time), 3) AS processing_time
FROM ProcessTimes
GROUP BY machine_id;
