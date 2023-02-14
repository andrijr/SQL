 -- Zak³adka do dok³adniejszego przeanalizowania w razie potrzeby
  
 CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
		BEGIN
	    select *, 'Inserted - tblTransaction' from Inserted
		select *, 'Deleted - tblTransaction' from Deleted
		END
    END
	go


	begin tran
	insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	values(123, '2015-01-01', 123)
	commit tran
	go


	Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132

	begin tran
	delete from ViewByDepartment
	where  Amount = -2.77 and EmployeeNumber = 132
	rollback tran
	go


	delete from ViewByDepartment
	where  Amount = -2.77 and EmployeeNumber = 132

	Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132

	delete from ViewByDepartment
	where  Amount = -2.77 and EmployeeNumber = 132
	go


  CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
		if @@ROWCOUNT >0 
		BEGIN
	    select *, 'Inserted - tblTransaction' from Inserted
		select *, 'Deleted - tblTransaction' from Deleted
		END
    END
	go


	delete from ViewByDepartment
	where  Amount = -2.77 and EmployeeNumber = 132
	go


	CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
		--if @@ROWCOUNT >0 
		BEGIN
	    select *, 'Inserted - tblTransaction' from Inserted
		select *, 'Deleted - tblTransaction' from Deleted
		END
    END
	go


	delete from tblTransaction
	where  Amount = 123  and EmployeeNumber = 123 and DateOfTransaction = '2015-01-01'
	go

	Select * from ViewByDepartment where Amount = -2.77 and EmployeeNumber = 132

	begin tran
	insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	values(123, '2015-01-01', 123)
	commit tran
	go

	update tblTransaction
	set DateOfTransaction = '2015-07-12'
	where  Amount = 123  and EmployeeNumber = 123 and DateOfTransaction = '2015-01-01'
	go


	CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER UPDATE
    AS
    BEGIN
		--if @@ROWCOUNT >0 
		if update(DateOfTransaction)
		BEGIN
	    select *, 'Inserted - tblTransaction' from Inserted
		select *, 'Deleted - tblTransaction' from Deleted
		END
    END
	go

	
	delete from tblTransaction
	where  Amount = 123  and EmployeeNumber = 123 
	
	delete  tblTransaction
	where  Amount = 123  and EmployeeNumber = 123 

	insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	values(123, '2015-07-11', 123)

	update tblTransaction
	set DateOfTransaction = '2015-07-12'
	where  Amount = 123  and EmployeeNumber = 123 and DateOfTransaction = '2015-07-11'
	go

	update tblTransaction
	set DateOfTransaction = '2015-07-12'
	where  Amount = 123  and EmployeeNumber = 123 and DateOfTransaction = '2015-07-12'
	go

	update tblTransaction
	set  EmployeeNumber = 124
	where  Amount = 123  and EmployeeNumber = 123 and DateOfTransaction = '2015-07-12'
	go


	CREATE or alter TRIGGER tr_tblTransaction
    ON dbo.tblTransaction
    AFTER UPDATE
    AS
    BEGIN
		--if @@ROWCOUNT >0 
		--if update(DateOfTransaction)
		if columns_updated() & 2 = 2  --- zamiast tego u¿ywaj if update(DateOfTransaction)
		BEGIN
	    select *, 'Inserted - tblTransaction' from Inserted
		select *, 'Deleted - tblTransaction' from Deleted
		END
    END
	go

	
	update tblTransaction
	set  EmployeeNumber = 123
	where  Amount = 123  and EmployeeNumber = 124 and DateOfTransaction = '2015-07-12'
	go

	update tblTransaction
	set  DateOfTransaction = '2015-07-12'
	where  Amount = 123  and EmployeeNumber = 124 and DateOfTransaction = '2015-07-12'
	go