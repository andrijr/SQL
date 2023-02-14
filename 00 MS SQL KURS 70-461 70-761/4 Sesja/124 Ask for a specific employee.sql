
select * from sys.views
select * from sys.procedures
select OBJECT_ID(N'dbo.P_Employee', N'P')
go

IF OBJECT_ID(N'dbo.P_Employee', N'P') IS NOT NULL 
drop proc P_Employee
go

-- brak schematu dbo
IF EXISTS (select * from sys.procedures where name = 'P_Employee')
drop proc P_Employee
go


use [70-461]
go
create or alter Proc dbo.P_Employee as
begin
	select EmployeeNumber, EmployeeFirstName, EmployeeLastName
	from tblEmployee
end
go


declare @EmployeeNumber int = 123
select @EmployeeNumber



use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumber int) as
begin
	select EmployeeNumber, EmployeeFirstName, EmployeeLastName
	from tblEmployee
	where EmployeeNumber = @EmployeeNumber
end
go

exec dbo.P_Employee 4



use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumber int) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber) 
	begin
		-- jak brak numeru to siê nie wykona
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber = @EmployeeNumber
		select 2
		select 3
	end
	-- to siê wykona zawsze
	select 1
end
go
exec dbo.P_Employee 123




declare @EmployeeNumber int = 5

IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber ) 
BEGIN
   SELECT 1 
END
ELSE
BEGIN
    SELECT 2
END