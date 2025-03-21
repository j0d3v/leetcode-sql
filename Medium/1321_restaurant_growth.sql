-- Problem: 1321. Restaurant Growth

-- Description:
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before).
-- average_amount should be rounded to two decimal places.

-- Return the result table ordered by visited_on in ascending order.

-- Tables:
-- Customer:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- | visited_on    | date    |
-- | amount        | int     |
-- +---------------+---------+

-- Solution:

SELECT DISTINCT
    visited_on,	(SELECT SUM(amount)
    FROM Customer
    WHERE visited_on BETWEEN DATE_SUB(C.visited_on, INTERVAL 6 DAY)
	AND C.visited_on
    ) AS amount,
	(SELECT ROUND(SUM(amount)/7,2)
    FROM Customer
    WHERE visited_on BETWEEN DATE_SUB(C.visited_on, INTERVAL 6 DAY)
	AND C.visited_on
    ) AS average_amount
FROM Customer AS C
WHERE DATE_SUB(visited_on, INTERVAL 6 DAY)
IN (SELECT visited_on FROM Customer)