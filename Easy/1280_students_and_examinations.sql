-- Problem: 1280. Students and Examinations

-- Description:
-- Write a solution to find the number of times each student attended each exam.

-- Return the result table ordered by student_id and subject_name.

-- Tables:
-- Students:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+

-- Subjects:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+

-- Examinations:
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+

-- Solution:

SELECT 
    ST.student_id, 
    ST.student_name, 
    SB.subject_name, 
    COUNT(E.subject_name) AS attended_exams
FROM Students ST
CROSS JOIN Subjects SB
LEFT JOIN Examinations E 
    ON ST.student_id = E.student_id AND SB.subject_name = E.subject_name
GROUP BY ST.student_id, ST.student_name, SB.subject_name
ORDER BY ST.student_id, ST.student_name;
