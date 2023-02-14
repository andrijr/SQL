
-- usuwa tylko jeden wiersz nie usunie wiêcej wierszy

Create or alter Trigger tr_ViewByDepartment
on dbo.ViewByDepartment
INSTEAD OF Delete
AS
begin
	-- najpierw poka¿e to co usuwa 
	select *, 'To Be Deleted' from deleted
	-- nastêpnie przypiszê zmienne z usuniêtej tabeli
	declare @EmployeeNumber as int
	declare @DateOfTransaction as smalldatetime
	declare @Amount as smallmoney
	-- tene select przypisujê do zmiennych nie wysy³a dane do nas
	select @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = Amount
	from deleted
	--select *, 'ViewByDepartment' from deleted
	-- a póxniej usunie  
	delete tblTransaction
	from tblTransaction as t
	where t.EmployeeNumber = @EmployeeNumber
	and t.DateOfTransaction = @DateOfTransaction
	and t.Amount = @Amount
end


begin tran
Select *, 'Before Delete' from ViewByDepartment where  EmployeeNumber = 132
delete from ViewByDepartment
where Amount = 861.16 and EmployeeNumber = 132
Select *, 'After Delete' from ViewByDepartment where  EmployeeNumber = 132
rollback tran
go

begin tran
Select *, 'Before Delete' from ViewByDepartment where  EmployeeNumber = 132
delete from ViewByDepartment
where EmployeeNumber = 132 -- and Amount = 861.16 
Select *, 'After Delete' from ViewByDepartment where  EmployeeNumber = 132
rollback tran
go


-- zawsze jak piszesz trigery ma obs³ugiwaæ wiêcej jak jeden
Create or alter Trigger tr_ViewByDepartment
on dbo.ViewByDepartment
INSTEAD OF Delete
AS
begin
	-- najpierw poka¿e to co usuwa 
	select *, 'To Be Deleted' from deleted
	delete tblTransaction
	from tblTransaction as t
	join deleted as d
	on t.EmployeeNumber = d.EmployeeNumber
	and t.DateOfTransaction = d.DateOfTransaction
	and t.Amount = d.Amount
end


begin tran
Select *, 'Before Delete' from ViewByDepartment where  EmployeeNumber = 132
delete from ViewByDepartment
where EmployeeNumber = 132 -- and Amount = 861.16 
Select *, 'After Delete' from ViewByDepartment where  EmployeeNumber = 132
rollback tran
go