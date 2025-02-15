-- Problem: 182. Duplicate Emails
--
-- Description:
-- Write a solution to report all the duplicate emails.
-- Note that it's guaranteed that the email field is not NULL.
--
-- Return the result table in any order.
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

SELECT email AS Email FROM Person
GROUP BY email
HAVING count(email) > 1;