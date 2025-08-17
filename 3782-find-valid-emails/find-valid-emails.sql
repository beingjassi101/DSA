# Write your MySQL query statement below
SELECT *
FROM Users
WHERE email REGEXP '^[a-zA-Z0-9]+@[a-zA-Z]+\\.com$';