
select * from sys.objects
select * from sys.tables
select * from sys.views


if object_Id(N'dbo.EmployeeTable', N'SN') is not null
drop synonym dbo.EmployeeTable

if exists( select * from sys.objects where name = 'EmployeeTable' )
drop synonym dbo.EmployeeTable

create  synonym EmployeeTable
for tblEmployee
go

select * from EmployeeTable



if object_Id(N'dbo.RemoteTable', N'SN') is not null
drop synonym dbo.RemoteTable

create  synonym RemoteTable
for server_name.database_name.schema_name.object_name
go

