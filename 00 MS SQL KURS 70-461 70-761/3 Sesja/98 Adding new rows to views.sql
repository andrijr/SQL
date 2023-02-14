USE [70-461]
GO


if exists(select * from INFORMATION_SCHEMA.views where table_name = 'ViewByDepartment' and TABLE_SCHEMA = 'dbo' )
	drop View dbo.ViewByDepartment
go


CREATE or ALTER View ViewByDepartment  as
select d.Department, t.EmployeeNumber, t.DateOfTransaction, t.Amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
--order by d.Department, t.EmployeeNumber
GO


-- mo¿na wstawiæ do widoku tylko je¿eli brak szyfrowania WITH ENCRYPTION
-- oraz wtedy kiedy id jest w zakresie widoku
-- i mo¿na to zrobiæ tylko w jednej tabeli podstawowej widoku
begin tran
insert into ViewByDepartment(EmployeeNumber, DateOfTransaction, Amount)
values (139, '2015-01-01', 999.99)

select * from ViewByDepartment order by  EmployeeNumber
rollback tran


-- nie mo¿na wstawiæ bo pojawi³ siê Departament z innej tabeli
begin tran
insert into ViewByDepartment(Department,EmployeeNumber, DateOfTransaction, Amount)
values (139, '2015-01-01', 999.99)

select * from ViewByDepartment order by  EmployeeNumber
rollback tran



begin tran
select * from ViewByDepartment where   EmployeeNumber in (139, 138)

update ViewByDepartment
set EmployeeNumber = 138
where EmployeeNumber = 139

select * from ViewByDepartment  where   EmployeeNumber in (139, 138)  order by  EmployeeNumber
rollback tran


begin tran
select * from ViewByDepartment where   EmployeeNumber in (139, 140)

update ViewByDepartment
set EmployeeNumber = 140
where EmployeeNumber = 139

select * from ViewByDepartment  where   EmployeeNumber in (139, 140)  order by  EmployeeNumber
rollback tran
go


CREATE or ALTER View ViewByDepartment  as
select d.Department, t.EmployeeNumber, t.DateOfTransaction, t.Amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
--order by d.Department, t.EmployeeNumber
WITH CHECK OPTION  -- sprawdzenei czy modyfikacja w zakresie
GO


begin tran
select * from ViewByDepartment where   EmployeeNumber in (139, 140)

update ViewByDepartment
set EmployeeNumber = 140
where EmployeeNumber = 139

select * from ViewByDepartment  where   EmployeeNumber in (139, 140)  order by  EmployeeNumber
rollback tran
go