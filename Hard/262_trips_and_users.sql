-- Problem: 262. Trips and Users
-- Description:
-- The cancellation rate is computed by dividing the number of canceled(by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

-- Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

-- Return the result table in any order.

-- Tables:
-- Trips:
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | id          | int      |
-- | client_id   | int      |
-- | driver_id   | int      |
-- | city_id     | int      |
-- | status      | enum     |
-- | request_at  | varchar  |
-- +-------------+----------+

-- Users:

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | users_id    | int      |
-- | banned      | enum     |
-- | role        | enum     |
-- +-------------+----------+

-- Solution:

WITH ValidTrips AS (
    SELECT request_at, status 
    FROM Trips
    WHERE client_id NOT IN (SELECT users_id FROM Users WHERE role = "client" AND banned = 'Yes')
      AND driver_id NOT IN (SELECT users_id FROM Users WHERE role = "driver" AND banned = 'Yes')
	  AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT R.request_at AS Day, 
       CAST(IFNULL(C.cancelled, 0) / R.requests AS DECIMAL(5,2)) AS "Cancellation Rate"
FROM (
    SELECT request_at, COUNT(*) AS requests FROM ValidTrips GROUP BY request_at
) AS R
LEFT JOIN (
    SELECT request_at, COUNT(*) AS cancelled 
    FROM ValidTrips WHERE status LIKE 'cancelled%' 
    GROUP BY request_at
) AS C ON R.request_at = C.request_at;