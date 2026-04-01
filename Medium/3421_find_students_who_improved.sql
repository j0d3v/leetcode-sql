-- Problem: 3421. Find Students Who Improved

-- Table:Scores
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student_id  | int     |
-- | subject     | varchar |
-- | score       | int     |
-- | exam_date   | varchar |
-- +-------------+---------+

-- Description: Write a solution to find the students who have shown improvement.
-- A student is considered to have shown improvement if they meet both of these conditions:

-- Have taken exams in the same subject on at least two different dates
-- Their latest score in that subject is higher than their first score

-- Return the result table ordered by student_id, subject in ascending order.

-- Solution:

SELECT 
    S1.STUDENT_ID,
    S1.SUBJECT,
    S1.SCORE AS first_score,
    S2.SCORE AS latest_score
FROM SCORES S1
INNER JOIN SCORES S2
    ON S2.STUDENT_ID = S1.STUDENT_ID
    AND S1.SUBJECT = S2.SUBJECT
    AND S2.SCORE > S1.SCORE
	AND (S2.EXAM_DATE, S1.EXAM_DATE) IN (
        SELECT MAX(EXAM_DATE), MIN(EXAM_DATE)
        FROM SCORES
        WHERE STUDENT_ID = S1.STUDENT_ID
        AND SUBJECT = S1.SUBJECT
        GROUP BY STUDENT_ID, SUBJECT
    )
ORDER BY S1.STUDENT_ID, S1.SUBJECT;