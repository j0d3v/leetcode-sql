-- Problem: 1393. Capital Gain/Loss

-- Description:
-- Write a solution to report the Capital gain/loss for each stock.

-- The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

-- Return the result table in any order.

-- Tables:
-- Stocks:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | stock_name    | varchar |
-- | operation     | enum    |
-- | operation_day | int     |
-- | price         | int     |
-- +---------------+---------+

-- Solution:

SELECT stock_name, SUM(
		CASE WHEN operation = 'Sell' THEN price
	   	ELSE -price END) AS capital_gain_loss 
FROM Stocks 
GROUP BY stock_name;