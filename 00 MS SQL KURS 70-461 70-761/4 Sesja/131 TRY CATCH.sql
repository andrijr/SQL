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
		select  count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		begin TRY
			select @TotalAmount = sum(Amount) from tblTransaction
			where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
			select @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
			where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
			--
			set @AverageBalance = @TotalAmount / @NumOfEmployee
			Return 0
		end TRY
		-- co robimy kiedy znajdziemy b³¹d
		begin catch
			set @AverageBalance = 0
			select ERROR_MESSAGE()
			Return 1
		end catch
end
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 4, 5 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 223, 227 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 9999, 9999 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go





select convert(int, 'two')

select try_convert(int, 'two')




use [70-461]
go
create or alter Proc dbo.P_AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as
begin
	SET NOCOUNT ON
	-- sprawdzamy czy jest taki numer
		-- jak brak numeru to siê nie wykona
		declare @TotalAmount money
		declare @NumOfEmployee  int
		select  sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select  count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		begin TRY
			select @TotalAmount =  sum(Amount) from tblTransaction
			where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
			select  @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
			where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
			--
			set  @AverageBalance = @TotalAmount / @NumOfEmployee
			Return 0
		end TRY
		-- co robimy kiedy znajdziemy b³¹d
		begin catch
			set @AverageBalance = 0
			select  ERROR_MESSAGE() as ErrorMesage, ERROR_LINE(), ERROR_NUMBER(), ERROR_PROCEDURE(), 
			ERROR_SEVERITY() 
			-- 0-10 for information 
			-- 16 - default 
			-- 20 - 25 stop SQL du¿y b³¹d
			, ERROR_STATE()
			Return 1
		end catch
end
go



Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 4, 5 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 223, 227 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go


Declare @AvgBalance int, @ReturnStatus int
exec @ReturnStatus =  P_AverageBalance 9999, 9999 , @AvgBalance OUTPUT
select @AvgBalance as AverageBalance, @ReturnStatus as Return_Status
go
