use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumber int) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber) 
	begin
		-- jak brak numeru to siê nie wykona
		if @EmployeeNumber < 300
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
		end
		else 
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			select * from tblTransaction where EmployeeNumber = @EmployeeNumber
		end
	end
	-- to siê wykona zawsze
	select 1
end
go

exec dbo.P_Employee 333 
execute P_Employee 223 , 227 