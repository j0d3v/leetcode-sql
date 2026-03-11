-- Problem: 1795. Rearrange Products Table

-- Tables:
-- Products :
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | store1      | int     |
-- | store2      | int     |
-- | store3      | int     |
-- +-------------+---------+
-- Each row in this table indicates the product's price in 3 different stores: store1, store2, and store3.

-- Description: Write a solution to rearrange the Products table so that each row has (product_id, store, price).
-- If a product is not available in a store
-- do not include a row with that product_id and store combination in the result table.

-- Solution:

SELECT product_id, 'store1' AS 'store', store1 AS 'price' FROM Products
WHERE store1 IS NOT NULL
UNION ALL
SELECT product_id, 'store2' AS 'store', store2 AS 'price' FROM Products
WHERE store2 IS NOT NULL
UNION ALL
SELECT product_id,'store3' AS 'store', store3 AS 'price' FROM Products
WHERE store3 IS NOT NULL