-- Problem: 601. Human Traffic of Stadium
-- Description:
-- Write a solution to display the records with three or more rows with consecutive id's,
-- and the number of people is greater than or equal to 100 for each.

-- Return the result table ordered by visit_date in ascending order.

-- Tables:
-- Stadium

--+---------------+---------+
--| Column Name   | Type    |
--+---------------+---------+
--| id            | int     |
--| visit_date    | date    |
--| people        | int     |
--+---------------+---------+

-- Solution:
WITH ConsecutiveGroups AS (
    SELECT 
        id, 
        visit_date, 
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS gap
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM ConsecutiveGroups
WHERE gap IN (
    SELECT gap 
    FROM ConsecutiveGroups
    GROUP BY gap
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date ASC;