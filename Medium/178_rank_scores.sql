-- Problem: 178. Rank Scores
--
-- Description:
-- Write a query to assign a ranking to scores based on the following rules:
-- 1. Scores should be ranked from highest to lowest.
-- 2. If multiple scores are the same, they should receive the same rank.
-- 3. The next rank after a tie should be the next consecutive integer (i.e., no gaps in ranking).
--
-- The result should be ordered by score in descending order.
--
-- Table Schema:
-- Scores:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | INT     |
-- | score       | DECIMAL |
-- +-------------+---------+

-- Solution:

-- Method 1: Using DENSE_RANK() window function (MySQL 8.0+)
SELECT score, DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS "rank"
FROM Scores;

-- Method 2: Using JOIN and COUNT() to rank scores manually
SELECT S.score, COUNT(T.score) AS 'rank'
FROM Scores AS S
    INNER JOIN (
        SELECT DISTINCT
            score
        FROM Scores
    ) AS T ON S.score <= T.score
GROUP BY
    S.id,
    S.score
ORDER BY S.score DESC;