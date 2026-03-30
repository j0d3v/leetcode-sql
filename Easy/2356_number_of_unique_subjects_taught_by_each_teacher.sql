-- Problem: 2356. Number of Unique Subjects Taught by Each Teacher

-- Table:Teacher
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+

-- Description: Write a solution to calculate the number of unique subjects each teacher teaches in the university.

-- Solution:

SELECT TEACHER_ID, COUNT(DISTINCT SUBJECT_ID) AS "cnt"
FROM TEACHER
GROUP BY TEACHER_ID;
