-- Problem: 619. Biggest Single Number

-- Description:
-- A single number is a number that appeared only once in the MyNumbers table.

-- Find the largest single number. If there is no single number, report null.

-- Tables:
-- MyNumbers:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+

-- Solution:

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS Nums;