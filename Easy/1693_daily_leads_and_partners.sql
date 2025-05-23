-- Problem: 1693. Daily Leads and Partners

-- Description:
-- For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's.

-- Return the result table in any order.

-- Tables:
-- DailySales:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | date_id     | date    |
-- | make_name   | varchar |
-- | lead_id     | int     |
-- | partner_id  | int     |
-- +-------------+---------+

-- Solution:

SELECT date_id, make_name, COUNT(DISTINCT lead_id) AS "unique_leads",
	COUNT(DISTINCT partner_id) AS "unique_partners"
FROM DailySales
GROUP BY date_id, make_name