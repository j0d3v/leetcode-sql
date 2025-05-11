-- Problem: 1729. Find Followers Count

-- Description:
-- Write a solution that will, for each user, return the number of followers.

-- Return the result table ordered by user_id in ascending order.

-- Tables:
-- Followers:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | user_id     | int  |
-- | follower_id | int  |
-- +-------------+------+

-- Solution:

SELECT user_id, COUNT(follower_id) AS "followers_count"
FROM Followers
GROUP BY user_id
ORDER BY user_id