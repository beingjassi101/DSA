# Write your MySQL query statement below
Select s.student_id, s.student_name, su.subject_name, count(e.subject_name) as attended_exams from Students s
CROSS JOIN Subjects SU
left join Examinations e on s.student_id = e.student_id
   AND SU.subject_name = E.subject_name
GROUP BY S.student_id, S.student_name, su.subject_name
ORDER BY S.student_id, S.student_name, su.subject_name
