-- Problem: 1527. Patients With a Condition

-- Description:
-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. 
-- Type I Diabetes always starts with `DIAB1` prefix.

-- Return the result table in any order.

-- Tables:
-- Patients:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | patient_id   | int     |
-- | patient_name | varchar |
-- | conditions   | varchar |
-- +--------------+---------+

-- Solution:

SELECT * FROM Patients
WHERE conditions LIKE "DIAB1%"
OR conditions LIKE "% DIAB1%"