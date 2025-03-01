-- Problem: 620. Not Boring Movies

-- Description:
-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
 
-- Return the result table ordered by rating in descending order.

-- Tables:
-- Cinema:
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | id             | int      |
-- | movie          | varchar  |
-- | description    | varchar  |
-- | rating         | float    |
-- +----------------+----------+

-- Solution:

SELECT * FROM cinema
WHERE id MOD 2 <> 0
AND description <> "boring"
ORDER BY rating DESC;