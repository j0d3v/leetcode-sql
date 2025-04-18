-- Problem: 608. Tree Node

-- Description:
-- Each node in the tree can be one of three types:

-- * "Leaf": if the node is a leaf node.
-- * "Root": if the node is the root of the tree.
-- * "Inner": If the node is neither a leaf node nor a root node.

-- Write a solution to report the type of each node in the tree.

-- Return the result table in any order.

-- Table Schema:
-- Tree:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | p_id        | int  |
-- +-------------+------+

-- Solution:

SELECT id, CASE 
	WHEN p_id IS NULL THEN "Root"
	WHEN id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN "Leaf"
	ELSE "Inner"
	END AS type
FROM Tree;