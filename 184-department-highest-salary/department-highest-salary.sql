# Write your MySQL query statement below
Select d.name as Department, e.name as Employee, e.salary as Salary from Employee e
join Department d on e.departmentId = d.id 
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);