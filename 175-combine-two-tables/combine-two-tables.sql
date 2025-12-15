# Write your MySQL query statement below
SELECT firstNAME, lastNAME, a.city, a.state
FROM Person
LEFT JOIN Address a ON Person.personId = a.personId;