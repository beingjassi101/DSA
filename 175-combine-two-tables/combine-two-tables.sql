# Write your MySQL query statement below
SELECT firstNAME, lastNAME, Address.city, Address.state
FROM Person
 LEFT JOIN Address ON Person.personId = Address.personId;