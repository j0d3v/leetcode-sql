-- Problem: 3436. Find Valid Emails

-- Table: Users
-- +-----------------+---------+
-- | Column Name     | Type    |
-- +-----------------+---------+
-- | user_id         | int     |
-- | email           | varchar |
-- +-----------------+---------+

-- Description: Find all valid email addresses. A valid email has:

-- Exactly one @ symbol.
-- Ends with .com.
-- Local part (before @) has only letters, numbers, or underscores.
-- Domain part (after @, before .com) contains only letters.

-- Return results ordered by user_id ascending.

-- Solution:

SELECT USER_ID, EMAIL FROM USERS
WHERE REGEXP_LIKE(EMAIL, '^\w+@[a-zA-Z]+\.com$')
ORDER BY USER_ID