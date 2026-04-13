-- Problem: 3564. Seasonal Sales Analysis

-- Table:
-- sales:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | sale_id       | int     |
-- | product_id    | int     |
-- | sale_date     | date    |
-- | quantity      | int     |
-- | price         | decimal |
-- +---------------+---------+

-- products:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | product_name  | varchar |
-- | category      | varchar |
-- +---------------+---------+

-- Description:
-- Write a solution to find the most popular product category for each season.
-- The seasons are defined as:

-- Winter: December, January, February
-- Spring: March, April, May
-- Summer: June, July, August
-- Fall: September, October, November

-- The popularity of a category is determined by the total quantity sold in that season.
-- If there is a tie, select the category with the highest total revenue (quantity × price).
-- If there is still a tie, return the lexicographically smaller category.

-- Return the result table ordered by season in ascending order.

-- Solution:

WITH AGG AS (
  SELECT SEASON,
		CATEGORY,
		SUM(QUANTITY) AS TOTAL_QUANTITY,
		SUM(QUANTITY * PRICE) AS TOTAL_REVENUE
    FROM (
    SELECT CASE
      WHEN EXTRACT(MONTH FROM S.SALE_DATE) IN (12, 1, 2) THEN 'Winter'
      WHEN EXTRACT(MONTH FROM S.SALE_DATE) IN (3, 4, 5) THEN 'Spring'
      WHEN EXTRACT(MONTH FROM S.SALE_DATE) IN (6, 7, 8) THEN 'Summer'
      ELSE 'Fall'
      END AS SEASON,
      P.CATEGORY AS CATEGORY,
	  S.QUANTITY AS QUANTITY,
      S.PRICE AS PRICE
      FROM SALES S
      JOIN PRODUCTS P
    ON P.PRODUCT_ID = S.PRODUCT_ID
  )
   GROUP BY SEASON, CATEGORY
)
SELECT SEASON, CATEGORY, TOTAL_QUANTITY, TOTAL_REVENUE
FROM (
SELECT AGG.*,
       ROW_NUMBER()
       OVER(PARTITION BY SEASON
      	ORDER BY TOTAL_QUANTITY DESC,TOTAL_REVENUE DESC, CATEGORY
       ) AS RN
  FROM AGG
)
WHERE RN = 1
ORDER BY SEASON;