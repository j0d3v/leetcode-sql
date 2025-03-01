-- Problem: 626. Exchange Seats

-- Description:
-- Write a solution to swap the seat id of every two consecutive students.
-- If the number of students is odd, the id of the last student is not swapped.

-- Return the result table ordered by id in ascending order.

-- Table Schema:
-- Seat:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+

-- Solution:

SELECT
    CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id = (SELECT COUNT(id) FROM Seat) THEN id
        ELSE id + 1
    END AS id, student
FROM Seat
ORDER BY id;