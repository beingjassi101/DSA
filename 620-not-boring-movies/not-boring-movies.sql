# Write your MySQL query statement below
Select * from Cinema 
where NOT (description = "boring" or id % 2 =0)
order by rating desc