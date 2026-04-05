-- Problem: 3497. Analyze Subscription Conversion

-- Table: UserActivity
-- +------------------+---------+
-- | Column Name      | Type    | 
-- +------------------+---------+
-- | user_id          | int     |
-- | activity_date    | date    |
-- | activity_type    | varchar |
-- | activity_duration| int     |
-- +------------------+---------+

-- Description: Analyze a subscription service with a 7-day free trial:

-- Identify users who convert to paid plans
-- Compute each user’s average daily activity during the trial (2 decimal places)
-- Compute each user’s average daily activity during the paid period (2 decimal places)
-- Return results ordered by user_id (ascending)

-- Solution:

SELECT *
FROM (
    SELECT 
        USER_ID,
        ROUND(AVG(CASE WHEN ACTIVITY_TYPE = 'free_trial' THEN ACTIVITY_DURATION END), 2) AS trial_avg_duration,
        ROUND(AVG(CASE WHEN ACTIVITY_TYPE = 'paid' THEN ACTIVITY_DURATION END), 2) AS paid_avg_duration
    FROM USERACTIVITY
    GROUP BY USER_ID
)
WHERE paid_avg_duration > 0
ORDER BY USER_ID ASC;