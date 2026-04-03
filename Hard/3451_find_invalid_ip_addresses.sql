-- Problem: 3451. Find Invalid IP Addresses

-- Table: logs
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | log_id      | int     |
-- | ip          | varchar |
-- | status_code | int     |
-- +-------------+---------+

-- Description: Write a solution to find invalid IP addresses.
-- An IPv4 address is invalid if it meets any of these conditions:

-- Contains numbers greater than 255 in any octet
-- Has leading zeros in any octet (like 01.02.03.04)
-- Has less or more than 4 octets

-- Return the result table ordered by invalid_count, ip in descending order respectively.

-- Solution:

WITH IP_PARTS AS (
    SELECT LOG_ID,
           IP,
           REGEXP_SUBSTR(IP, '[0-9]+', 1, 1) AS part1,
           REGEXP_SUBSTR(IP, '[0-9]+', 1, 2) AS part2,
           REGEXP_SUBSTR(IP, '[0-9]+', 1, 3) AS part3,
           REGEXP_SUBSTR(IP, '[0-9]+', 1, 4) AS part4,
           REGEXP_COUNT(IP, '[0-9]+') AS parts_count
    FROM LOGS
)
SELECT IP,
       COUNT(*) AS invalid_count
FROM IP_PARTS
WHERE 
    parts_count != 4
    OR (part1 IS NULL OR part2 IS NULL OR part3 IS NULL OR part4 IS NULL)
    OR ((part1 LIKE '0%' AND part1 != '0') OR
        (part2 LIKE '0%' AND part2 != '0') OR
        (part3 LIKE '0%' AND part3 != '0') OR
        (part4 LIKE '0%' AND part4 != '0'))
    OR ((TO_NUMBER(part1) < 0 OR TO_NUMBER(part1) > 255) OR
        (TO_NUMBER(part2) < 0 OR TO_NUMBER(part2) > 255) OR
        (TO_NUMBER(part3) < 0 OR TO_NUMBER(part3) > 255) OR
        (TO_NUMBER(part4) < 0 OR TO_NUMBER(part4) > 255))
GROUP BY IP
ORDER BY invalid_count DESC, IP DESC;