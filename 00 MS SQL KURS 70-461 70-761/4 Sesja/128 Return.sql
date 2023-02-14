-- s� dwa sposoby na uzyskanie wynik�w z procedury
-- jeden u�ycie OUTPUT
-- drugi u�ycie RETURN


use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo) 
	begin
		-- jak brak numeru to si� nie wykona
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber Between @EmployeeNumberFrom and @EmployeeNumberTo
		set @NumberOfRows = @@ROWCOUNT
	end
	else
	begin
		set  @NumberOfRows = 0
	end 
end
go

-- to bez EXEC nie zadzia�a daltego przed procedur� nale�y zawsze u�ywa� EXEC lub EXECUTE
Declare @NumberRows int
P_Employee 323, 327 , @NumberRows OUTPUT
select @NumberRows
go


Declare @NumberRows int
exec P_Employee  323, 327 , @NumberRows OUTPUT
select @NumberRows
go


Declare @NumberRows int
exec P_Employee  4, 6 , @NumberRows OUTPUT
select @NumberRows
go


Declare @NumberRows int
exec P_Employee @EmployeeNumberFrom = 323 , @EmployeeNumberTo = 327, @NumberOfRows = @NumberRows OUTPUT
select @NumberRows
go



use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo) 
	begin
		-- jak brak numeru to si� nie wykona
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber Between @EmployeeNumberFrom and @EmployeeNumberTo
		set @NumberOfRows = @@ROWCOUNT
		Return  0 -- zero oznacza zazwyczaj �e posz�o dobrze
	end
	else
	begin
		set  @NumberOfRows = 0
		Return  1 -- a warto�� nie zerowa oznacza �e posz�o �lie
	end 
end
go


Declare @NumberRows int, @ReturnStatus int
exec @ReturnStatus =  P_Employee 4, 6 , @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
go


Declare @NumberRows int, @ReturnStatus int
exec @ReturnStatus =  P_Employee 323, 327 , @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
go


Declare @NumberRows int, @ReturnStatus int
exec @ReturnStatus = P_Employee @EmployeeNumberFrom = 323 , @EmployeeNumberTo = 327, @NumberOfRows = @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
go
