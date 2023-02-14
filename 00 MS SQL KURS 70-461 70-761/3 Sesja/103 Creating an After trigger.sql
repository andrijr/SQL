
--CREATE TRIGGER TriggerName
--    ON [dbo].[TableName]
--    FOR lub AFTER lub INSTED OF DELETE, INSERT, UPDATE
--    AS
--    BEGIN
--    SET NOCOUNT ON
--    END



  SET NOCOUNT ON -- to w�acza i wy��cza brak powiadomienia w Messages informacji o ilo�ci wierszy
select * from tblDepartment
  SET NOCOUNT OFF
go

  CREATE TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
    select * from Inserted
	select * from Deleted
    END
go


-- stworzyli�my triger i teraz robimy insert i sprawdamy
	begin tran
	insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	values(123, '2015-01-01', 123)
	rollback tran
	go

drop trigger tr_tblTransaction
go

  CREATE TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
    select * from Inserted
	select * from Deleted
    END

-- stworzyli�my triger i teraz robimy insert i sprawdamy
	begin tran
	insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	values(123, '2015-01-01', 123)
	rollback tran
	go
