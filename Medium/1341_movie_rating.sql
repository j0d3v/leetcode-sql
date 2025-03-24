-- Problem: 1341. Movie Rating

-- Description:
-- Write a solution to:

-- Find the name of the user who has rated the greatest number of movies.
-- In case of a tie, return the lexicographically smaller user name.

-- Find the movie name with the highest average rating in February 2020.
-- In case of a tie, return the lexicographically smaller movie name.

-- Tables:
-- Movies

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+

-- Users:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+

-- MovieRating:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+

-- Solution:

(
  SELECT U.name AS result
  FROM Users AS U
  JOIN MovieRating AS M ON U.user_id = M.user_id
  GROUP BY U.name
  ORDER BY COUNT(DISTINCT M.movie_id) DESC, U.name
  LIMIT 1
)
UNION ALL
(
  SELECT Ms.title AS result
  FROM Movies AS Ms
  JOIN MovieRating AS Mv ON Ms.movie_id = Mv.movie_id
  WHERE YEAR(Mv.created_at) = 2020 AND MONTH(Mv.created_at) = 2
  GROUP BY Ms.title
  ORDER BY AVG(Mv.rating) DESC, Ms.title
  LIMIT 1
)
