-- wodoki indeksowane
select * from dbo.ViewByDepartment
go
-- zobaczmy wykres
-- Seek jest o  szybsze jak Scan - Seek jest oparte na indeksie
-- jeœli masz indeks klastrowany oparty na numerze pracownika to zostanie on automatycznie posortowany
-- przy indeksowaniu widoku nie mo¿na u¿ywaæ TOP DISTINCT ORDER BY WITH CHECK OPTION LEFT JOIN RIGHT JOIN


CREATE or ALTER View ViewByDepartment with schemabinding as  -- dla utworzenia indeksu dla widoku  musi byæ vidok powi¹zany ze schematem
select d.Department, t.EmployeeNumber, t.DateOfTransaction, t.Amount
from dbo.tblDepartment d
join dbo.tblEmployee e
on d.Department = e.Department
join dbo.tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
GO

create unique clustered INDEX inx_ViewByDepartment on dbo.ViewByDepartment (EmployeeNumber, Department, DateOfTransaction)


--nie mo¿emy usun¹c tablie poniewa¿ jest widok do niej z indeksem i td
begin tran
drop table tblEmployee
rollback tran


--- je¿eli jeden widok usuwa siê tabela
create table test
(id int not null )
go

create table test2
(id int not null 
, name varchar(10) )
go

create or alter view ViewTest as
select * from test
go

begin tran
drop table test
rollback tran
go

create or alter view ViewTest2 as
select * from test t
join test2 tt
on t.id = tt.id
go

begin tran
drop table test2
rollback tran
go
