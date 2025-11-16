# Write your MySQL query statement below
Select d.name as Department, e.name as Employee, salary as Salary from Department d
join Employee e on d.id = e.departmentId 
where salary = (
    select max(salary) from employee e 
    where e.departmentId = d.Id
)
