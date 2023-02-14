

select count(Department) as NumberOfDepartment
from 
(select Department , count(*) as NamberOfDepartment
from tblEmployee
group by Department ) as newTable

select distinct Department
from tblEmployee

select distinct Department, EmployeeFirstName
from tblEmployee



drop table tblDepartment

select distinct Department, N'' as DepartmentHead
into tblDepartment
from tblEmployee

select distinct Department, convert(nvarchar(30), N'') as DepartmentHead
into tblDepartment
from tblEmployee

alter table tblDepartment
alter column DepartmentHead nvarchar(40) null