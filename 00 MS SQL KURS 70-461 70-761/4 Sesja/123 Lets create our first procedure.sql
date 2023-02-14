
create or alter View V_Employee as
select EmployeeNumber, EmployeeFirstName, EmployeeLastName
from tblEmployee
go


create or alter Proc P_Employee as
begin
	select EmployeeNumber, EmployeeFirstName, EmployeeLastName
	from tblEmployee
end
go

P_Employee -- te¿ wywo³a procedurê tylko musi byæ go przed
execute P_Employee
exec P_Employee



