-- Problem: 3220. Odd and Even Transactions

-- Table: transactions
-- +------------------+------+
-- | Column Name      | Type | 
-- +------------------+------+
-- | transaction_id   | int  |
-- | amount           | int  |
-- | transaction_date | date |
-- +------------------+------+

-- Description: Write a solution to find the sum of amounts for odd and even transactions for each day.
-- If there are no odd or even transactions for a specific date, display as 0.

-- Return the result table ordered by transaction_date in ascending order.

-- Solution:

SELECT TRANSACTION_DATE,
SUM(CASE WHEN MOD(AMOUNT,2) != 0 THEN AMOUNT ELSE 0 END) AS "odd_sum",
SUM(CASE WHEN MOD(AMOUNT,2) = 0 THEN AMOUNT ELSE 0 END) AS "even_sum"
FROM TRANSACTIONS
GROUP BY TRANSACTION_DATE
ORDER BY TRANSACTION_DATE ASC