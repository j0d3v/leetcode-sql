-- Problem: 550. Game Play Analysis IV
-- Description:
-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.
-- In other words, you need to count the number of players that logged in for at least two consecutive days
-- starting from their first login date, then divide that number by the total number of players.

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


SELECT ROUND(
    COUNT(A.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2
) AS fraction
FROM Activity AS A
JOIN (
    SELECT player_id, MIN(event_date) AS min_event_date
    FROM Activity
    GROUP BY player_id
) AS MED
    ON A.player_id = MED.player_id
    AND A.event_date = DATE_ADD(MED.min_event_date, INTERVAL 1 DAY);