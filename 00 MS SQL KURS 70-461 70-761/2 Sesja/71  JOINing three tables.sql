
select * 
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber


select d.Department, d.DepartmentHead, sum(t.Amount) as SumOfAmount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
group by d.Department, d.DepartmentHead
order by d.Department

insert into tblDepartment (Department, DepartmentHead) 
values ('Accounts', 'James')

select * from tblDepartment
