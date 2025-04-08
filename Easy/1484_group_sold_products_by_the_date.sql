-- Problem: 1484. Group Sold Products By The Date

-- Description:
-- Write a solution to find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.

-- Return the result table ordered by sell_date.

-- Tables:
-- Activities:

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | sell_date   | date    |
-- | product     | varchar |
-- +-------------+---------+

-- Solution:

SELECT
    sell_date,
    COUNT(DISTINCT product) as num_sold,
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY product ASC SEPARATOR ','
    ) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date