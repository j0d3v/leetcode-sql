-- Problem: 1934. Confirmation Rate

-- Table: Signups
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- +----------------+----------+

-- Table: Confirmations
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- | action         | ENUM     |
-- +----------------+----------+
-- action is an ENUM (category) of the type ('confirmed', 'timeout')

-- Description: The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages.
-- The confirmation rate of a user that did not request any confirmation messages is 0.
-- Round the confirmation rate to two decimal places.
-- Write a solution to find the confirmation rate of each user.

-- Solution:

SELECT SI.user_id,
       ROUND(
           COUNT(CASE WHEN CO.action = 'confirmed' THEN 1 END)
           / COUNT(SI.time_stamp),
           2
       ) AS confirmation_rate
FROM Signups SI
LEFT JOIN Confirmations CO
  ON CO.user_id = SI.user_id
GROUP BY SI.user_id;