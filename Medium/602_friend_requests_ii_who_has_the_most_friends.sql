-- Problem: 602. Friend Requests II: Who Has the Most Friends

-- Description:
-- Write a solution to find the people who have the most friends and the most friends number.
 
-- The test cases are generated so that only one person has the most friends.

-- Tables:
-- RequestAccepted:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+

-- Solution:

WITH Requests AS (
    SELECT accepter_id AS id, COUNT(*) AS n FROM RequestAccepted GROUP BY accepter_id
    UNION ALL
    SELECT requester_id AS id, COUNT(*) AS n FROM RequestAccepted GROUP BY requester_id
)
SELECT id, SUM(n) AS num
FROM Requests
GROUP BY id
ORDER BY num DESC
LIMIT 1;