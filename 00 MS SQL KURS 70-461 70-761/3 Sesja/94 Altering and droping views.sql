USE [70-461]
GO


select * from sys.views

select * from sys.views where name = 'ViewByDepartment'

if exists(select * from sys.views where name = 'ViewByDepartment')
	drop View dbo.ViewByDepartment
go


select * from INFORMATION_SCHEMA.views

if exists(select * from INFORMATION_SCHEMA.views where table_name = 'ViewByDepartment' and TABLE_SCHEMA = 'dbo' )
	drop View dbo.ViewByDepartment
go

CREATE or ALTER View ViewByDepartment as
select d.Department, t.EmployeeNumber, t.DateOfTransaction, t.Amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
--order by d.Department, t.EmployeeNumber
GO

select * from sys.tables
select * from sys.objects