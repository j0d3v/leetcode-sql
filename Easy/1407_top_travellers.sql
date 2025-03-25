-- Problem: 1407. Top Travellers

-- Description:
-- Write a solution to report the distance traveled by each user.

-- Return the result table ordered by travelled_distance in descending order,
-- if two or more users traveled the same distance,
-- order them by their name in ascending order.

-- Tables:
-- Users:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+

-- Rides:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | user_id       | int     |
-- | distance      | int     |
-- +---------------+---------+

-- Solution:

SELECT name, SUM(IFNULL(distance, 0)) AS travelled_distance
FROM Users AS U
LEFT JOIN Rides AS R ON R.user_id = U.id
GROUP BY U.id, name
ORDER BY travelled_distance DESC, name ASC