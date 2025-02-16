-- Problem: 196. Delete Duplicate Emails
--
-- Description:
-- Write a solution to delete all duplicate emails,
-- keeping only one unique email with the smallest id.
--
-- Tables:
-- Person
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+

-- Solution:

WITH duplicated_emails AS (
    SELECT id
    FROM (
        SELECT id, 
               ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS row_num
        FROM `Person`
    ) AS P
    WHERE P.row_num > 1
)
DELETE P
FROM `Person` AS P
JOIN duplicated_emails AS D
ON P.id = D.id;

