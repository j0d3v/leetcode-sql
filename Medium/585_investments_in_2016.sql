-- Problem: 585. Investments in 2016

-- Description:
-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

-- - have the same tiv_2015 value as one or more other policyholders, and
-- - are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).

-- Round tiv_2016 to two decimal places.

-- Tables:
-- Insurance:
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | pid         | int   |
-- | tiv_2015    | float |
-- | tiv_2016    | float |
-- | lat         | float |
-- | lon         | float |
-- +-------------+-------+

-- Solution:

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016 FROM Insurance
WHERE (lat,lon) NOT IN (
	SELECT DISTINCT lat,lon FROM Insurance
	GROUP BY lat,lon
	HAVING COUNT(pid) > 1
)
AND tiv_2015 IN (
	SELECT DISTINCT tiv_2015 FROM Insurance
	GROUP BY tiv_2015
	HAVING COUNT(pid) > 1
);