select * from tblTransaction
where EmployeeNumber between 3 and 11
order by EmployeeNumber


select sum(Amount) from tblTransaction
where EmployeeNumber between 3 and 11


select count(EmployeeNumber) from tblTransaction
where EmployeeNumber between 3 and 11

select distinct count(EmployeeNumber) from tblTransaction
where EmployeeNumber between 3 and 11

select  count(distinct EmployeeNumber) from tblTransaction
where EmployeeNumber between 3 and 11

select * from tblEmployee
where EmployeeNumber between 3 and 11

select  count(distinct EmployeeNumber) from tblEmployee
where EmployeeNumber between 3 and 11



use [70-461]
go
create or alter Proc dbo.P_AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as
begin
	-- sprawdzamy czy jest taki numer
		-- jak brak numeru to siê nie wykona
		declare @TotalAmount money
		declare @NumOfEmployee  int
		select  sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select @TotalAmount =  sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		--
		select  count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select  @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		set @AverageBalance = @TotalAmount / @NumOfEmployee
end
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 223, 227 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go

Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 4, 5 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go



use [70-461]
go
create or alter Proc dbo.P_AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as
begin
	-- sprawdzamy czy jest taki numer
		-- jak brak numeru to siê nie wykona
		declare @TotalAmount money
		declare @NumOfEmployee  int
		select  sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select @TotalAmount =  sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		--
		select  count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select  @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		if @NumOfEmployee = 0
			set @AverageBalance = 0
		else
		set @AverageBalance = @TotalAmount / @NumOfEmployee
		
end
go



Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 223, 227 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance --, @ReturnStatus as Return_Status
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 4, 5 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance --, @ReturnStatus as Return_Status
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 9999, 9999 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance --, @ReturnStatus as Return_Status
go
