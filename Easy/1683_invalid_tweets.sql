-- Problem: 1683. Invalid Tweets

-- Description:
-- Write a solution to find the IDs of the invalid tweets.
-- The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

-- Tables:
-- Tweets:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | tweet_id       | int     |
-- | content        | varchar |
-- +----------------+---------+

-- Solution:

SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15