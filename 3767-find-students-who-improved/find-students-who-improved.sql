# Write your MySQL query statement below
WITH CTE AS (
    SELECT 
        student_id, 
        subject, 
        COUNT(score) AS exams_taken, 
        MIN(exam_date) AS first_exam_date, 
        MAX(exam_date) AS latest_exam_date
    FROM Scores
    GROUP BY student_id, subject
),
CTE2 AS (
    SELECT 
        c.student_id, 
        c.subject, 
        score, 
        ROW_NUMBER() OVER(PARTITION BY c.student_id, c.subject ORDER BY exam_date) AS score_order
    FROM CTE c
    JOIN Scores s
        ON c.student_id = s.student_id 
        AND c.subject = s.subject 
        AND (c.first_exam_date = s.exam_date OR c.latest_exam_date = s.exam_date)
    WHERE exams_taken > 1
),
CTE3 AS (
    SELECT 
        student_id, 
        subject, 
        IF(score_order = 1, score, 0) AS first_score, 
        IF(score_order = 2, score, 0) AS latest_score 
    FROM CTE2
)
SELECT 
    student_id, 
    subject, 
    MAX(first_score) AS first_score, 
    MAX(latest_score) AS latest_score 
FROM CTE3
GROUP BY student_id, subject
HAVING latest_score > first_score
ORDER BY student_id, subject;