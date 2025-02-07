-- Problem: 175. Combine Two Tables
-- Description:
-- Write an SQL query to report the first name, last name, city, and state of each person in the Person table.
-- If the address of a personId is not present in the Address table, report NULL for city and state.

-- Tables:
-- Person:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | personId    | int     |
-- | lastName    | varchar |
-- | firstName   | varchar |
-- +-------------+---------+

-- Address:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | addressId   | int     |
-- | personId    | int     |
-- | city        | varchar |
-- | state       | varchar |
-- +-------------+---------+

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM Person AS p
LEFT JOIN Address AS a 
    ON p.personId = a.personId;
