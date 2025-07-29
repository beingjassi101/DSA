# Write your MySQL query statement below
Select p.email as Email from Person p
group by email 
having count(email) > 1;