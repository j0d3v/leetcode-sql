-- Problem: 511. Game Play Analysis I
-- Description:
-- Write a solution to find the first login date for each player.

-- Return the result table in any order.
--
-- Tables:
-- Activity:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+

-- Solution:

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;