-- Problem: 3521. Find Product Recommendation Pairs

-- Table: ProductPurchases
-- +-------------+------+
-- | Column Name | Type | 
-- +-------------+------+
-- | user_id     | int  |
-- | product_id  | int  |
-- | quantity    | int  |
-- +-------------+------+

-- ProductInfo
-- +-------------+---------+
-- | Column Name | Type    | 
-- +-------------+---------+
-- | product_id  | int     |
-- | category    | varchar |
-- | price       | decimal |
-- +-------------+---------+


-- Description: 
-- Amazon wants to add a “Customers who bought this also bought…” feature.
-- Write a solution to:

-- Find distinct product pairs (product1_id < product2_id) frequently bought together.
-- Count how many customers purchased both products.
-- Include pairs bought by at least 3 customers.

-- Return the table ordered by customer_count descending, then product1_id and product2_id ascending.

-- Solution:

WITH ProductPairs AS (
    SELECT 
        P1.product_id AS product1_id,
        P2.product_id AS product2_id,
        COUNT(*) AS customer_count
    FROM PRODUCTPURCHASES P1
    JOIN PRODUCTPURCHASES P2
        ON P1.user_id = P2.user_id
        AND P1.product_id < P2.product_id
    GROUP BY P1.product_id, P2.product_id
    HAVING COUNT(*) >= 3
)
SELECT 
    PP.product1_id,
    PP.product2_id,
    PR1.category AS product1_category,
    PR2.category AS product2_category,
    PP.customer_count
FROM ProductPairs PP
JOIN PRODUCTINFO PR1 ON PP.product1_id = PR1.product_id
JOIN PRODUCTINFO PR2 ON PP.product2_id = PR2.product_id
ORDER BY PP.customer_count DESC, PP.product1_id, PP.product2_id;