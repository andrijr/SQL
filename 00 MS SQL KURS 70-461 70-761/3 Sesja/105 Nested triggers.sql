--@@Nestlevel -- pokazujê w którym poziomie jesteœmy 


  CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
	select @@NESTLEVEL as nest_level
    select * from Inserted
	select * from Deleted
    END
	go


	begin tran
	insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	values(123, '2015-01-01', 123)
	rollback tran
	go


begin tran
Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132
delete from ViewByDepartment
where Amount = -2.77 and EmployeeNumber = 132
Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132
rollback tran
go


  CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
		if @@NESTLEVEL = 1
		begin
		select @@NESTLEVEL as nest_level
		select *, 'TableInserted' from Inserted
		select *, 'TableDeleted' from Deleted
		end
    END
	go


-- zmiana konfiguracji serwera aby wl¹czyæ lub wy³¹czyæ zagnie¿d¿enia
-- sprawdzamy ustawienia serwera
EXEC sp_configure 'nested triggers';

-- teraz ustawiamy aby wartoœæ wynosi³a 0
EXEC sp_configure 'nested triggers', 0;
RECONFIGURE
GO

-- teraz ustawiamy z powrotem tak jak by³o aby wynosi³a 1
EXEC sp_configure 'nested triggers', 1;
RECONFIGURE
GO
