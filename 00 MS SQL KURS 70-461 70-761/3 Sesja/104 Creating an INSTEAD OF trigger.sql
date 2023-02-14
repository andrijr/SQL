Create Trigger tr_ViewByDepartment
on dbo.ViewByDepartment
INSTEAD OF Delete
AS
begin
	select *, 'ViewByDepartment' from deleted
end


begin tran
Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132
delete from ViewByDepartment
where Amount = -2.77 and EmployeeNumber = 132
Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132
rollback tran
go
-- nie mo�emy usun�� bo widok jest oparty na kulku tabelach
-- mimo to triger zwraca informacj� co chcieli�my usun��


Create or alter Trigger tr_ViewByDepartment
on dbo.ViewByDepartment
INSTEAD OF Delete
AS
begin
	declare @EmployeeNumber as int
	declare @DateOfTransaction as smalldatetime
	declare @Amount as smallmoney
	-- tene select przypisuj� do zmiennych nie wysy�a dane do nas
	select @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = Amount
	from deleted
	--select *, 'ViewByDepartment' from deleted
	delete tblTransaction
	from tblTransaction as t
	where t.EmployeeNumber = @EmployeeNumber
	and t.DateOfTransaction = @DateOfTransaction
	and t.Amount = @Amount
end


begin tran
--Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132
delete from ViewByDepartment
where Amount = -2.77 and EmployeeNumber = 132
--Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132
rollback tran
go

-- WITH CHECK OPTION zatrzymuj� tylko zmiany w widoku 
-- a my nie zmieniamy tabele tylko zmieniamy podstawow� tabele na kt�rej jest oparty widok
