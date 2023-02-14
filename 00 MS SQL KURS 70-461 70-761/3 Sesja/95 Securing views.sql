-- wszystkie procedury i funkcjê
select * from sys.syscomments
select * from sys.views

select v.name, c.text
from sys.views v
join sys.syscomments c
on c.id = v.object_id


select OBJECT_DEFINITION(object_id('dbo.ViewByDepartment'))

select * from sys.sql_modules
go

-- ukrywa definicjê widoku w bazie danych
CREATE or ALTER View ViewByDepartment WITH ENCRYPTION as
select d.Department, t.EmployeeNumber, t.DateOfTransaction, t.Amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
--order by d.Department, t.EmployeeNumber
GO
