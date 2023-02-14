use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo) 
	begin
		-- jak brak numeru to si� nie wykona
		declare @EmployeeNumber int = @EmployeeNumberFrom
		while @EmployeeNumber < = @EmployeeNumberTo
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			set @EmployeeNumber		= @EmployeeNumber + 1
			IF @EmployeeNumber <= 500
				CONTINUE
			IF @EmployeeNumber > 500
				BREAK
			GOTO HELLO
		end
	end
	-- to si� wykona zawsze
	select 1
end
HELLO:
go

exec dbo.P_Employee 333 , 335
execute P_Employee 223 , 227
exec P_Employee @EmployeeNumberFrom = 333 , @EmployeeNumberTo = 337

-- BREAK -- wychodzi z p�tli
-- CONTINUE -- zamiast wyj�� z p�tli lub i�� do ko�ca wraca do pocz�tku
-- GOTO -- przejd� do konkretnej linii -- lepiej tego nie u�ywa� chyba ze absolutnie absolutnie musisz -- nazywa si� logika spagetti






use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo) 
	begin
		-- jak brak numeru to si� nie wykona
		declare @EmployeeNumber int = @EmployeeNumberFrom
		while @EmployeeNumber < = @EmployeeNumberTo
		begin
			if not exists ( select * from tblEmployee where EmployeeNumber = @EmployeeNumber) 
			begin
				set @EmployeeNumber =+ 1
				CONTINUE
			end
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			set @EmployeeNumber		= @EmployeeNumber + 1

		end
	end
	-- to si� wykona zawsze
	select 1
end
go


use [70-461]
go
create or alter Proc dbo.P_Employee(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	-- sprawdzamy czy jest taki numer
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo) 
	begin
		-- jak brak numeru to si� nie wykona
		declare @EmployeeNumber int = @EmployeeNumberFrom
		while @EmployeeNumber < = @EmployeeNumberTo
		begin
			if  exists ( select * from tblEmployee where EmployeeNumber = @EmployeeNumber) 
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			set @EmployeeNumber		= @EmployeeNumber + 1

		end
	end
	-- to si� wykona zawsze
	select 1
end
go


exec P_Employee @EmployeeNumberFrom = 333 , @EmployeeNumberTo = 337