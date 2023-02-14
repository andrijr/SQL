use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo) 
	begin
		-- jak brak numeru to siê nie wykona
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber Between @EmployeeNumberFrom and @EmployeeNumberTo
	end
	-- to siê wykona zawsze
	select 1
end
go

exec dbo.P_Employee 333 , 335
execute P_Employee 223 , 227
exec P_Employee @EmployeeNumberFrom = 333 , @EmployeeNumberTo = 337