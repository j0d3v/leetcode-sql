-- Problem: 1211. Queries Quality and Percentage

-- Description:
-- We define query qualit\' as:
## The average of the ratio between query rating and its position.

-- We also define poor query percentage as:
## The percentage of all queries with rating less than 3.

-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

-- Return the result table in any order.

-- Tables:
-- Queries:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+

-- Solution:

SELECT query_name,
    ROUND(SUM(rating / position) / COUNT(position), 2) AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2
    ) AS poor_query_percentage
FROM Queries AS Q
GROUP BY query_name;