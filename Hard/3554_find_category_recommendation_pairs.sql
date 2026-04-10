-- Problem: 3554. Find Category Recommendation Pairs

-- Table: ProductPurchases:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | user_id     | int  |
-- | product_id  | int  |
-- | quantity    | int  |
-- +-------------+------+

-- ProductInfo:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | category    | varchar |
-- | price       | decimal |
-- +-------------+---------+

-- Description: Amazon wants to analyze shopping patterns:

-- Find all category pairs (category1 < category2)
-- Count unique customers who bought from both categories
-- Keep pairs with at least 3 customers

-- Return results sorted by customer_count (desc), then category1 and category2 (asc).

-- Solution:

WITH PurchasesWithCategory AS (
  SELECT DISTINCT PP.user_id, PI.product_id, PI.category
  FROM ProductInfo PI
  JOIN ProductPurchases PP ON PP.product_id = PI.product_id
)
SELECT
  P1.category AS category1,
  P2.category AS category2,
  COUNT(DISTINCT P1.user_id) AS customer_count
FROM PurchasesWithCategory P1
JOIN PurchasesWithCategory P2
  ON P1.user_id = P2.user_id
 AND P1.product_id <> P2.product_id
 AND P1.category < P2.category
GROUP BY P1.category, P2.category
HAVING COUNT(DISTINCT P1.user_id) >= 3
ORDER BY customer_count DESC, P1.category, P2.category;
