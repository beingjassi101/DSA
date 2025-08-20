# Write your MySQL query statement below
SELECT s.Score,
       (SELECT COUNT(DISTINCT s2.Score)
        FROM Scores s2
        WHERE s2.Score >= s.Score) AS `rank`
FROM Scores s
ORDER BY s.Score DESC;

