
drop index idx_tblEmployeeNumber on dbo.tblEmployee
drop index idx_LastNameForHr on dbo.tblEmployee
drop index idx_DateOfBirthWithIncludes  on dbo.tblEmployee
drop index idx_tblEmployee_DateOfBirth_Department on dbo.tblEmployee
drop index idx_tblEmployee_DateOfBirth on dbo.tblEmployee


create clustered index idx_EmployeeNumber on dbo.tblEmployee ( EmployeeNumber)

select *
from tblEmployee
where EmployeeNumber = 134 -- seek


drop index idx_EmployeeNumber on dbo.tblEmployee

select *
from tblEmployee
where EmployeeNumber = 134 -- scan


select *
from tblEmployee as e
left join tblDepartment as d
on e.Department = d.Department