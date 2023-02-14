-- do przeanalizowania

BEGIN TRAN
Alter Table tblTransaction
add Comments varchar(50) NULL
GO --DDL

select * from tblTransaction

MERGE INTO tblTransaction as T -- DML
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
		UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
OUTPUT inserted.*, deleted.*
; -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
ROLLBACK TRAN
go




BEGIN TRAN
Alter Table tblTransaction
add Comments varchar(50) NULL
GO --DDL

--select * from tblTransaction

MERGE INTO tblTransaction as T -- DML
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
		UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updaded Row'
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber, Comments)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
--OUTPUT inserted.*, deleted.*
; -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
select * from tblTransaction
ROLLBACK TRAN
go




BEGIN TRAN
Alter Table tblTransaction
add Comments varchar(50) NULL
GO --DDL

MERGE INTO tblTransaction as T -- DML
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
		UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updaded Row'
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber, Comments)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
		UPDATE SET Comments = 'Unchanged'
--OUTPUT inserted.*, deleted.*
; -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
select * from tblTransaction
ROLLBACK TRAN
go


BEGIN TRAN
Alter Table tblTransaction
add Comments varchar(50) NULL
GO --DDL

MERGE INTO tblTransaction as T -- DML
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED AND t.EmployeeNumber > 200 THEN 
		UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updaded Row'
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber, Comments)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
		UPDATE SET Comments = 'Unchanged'
--OUTPUT inserted.*, deleted.*
; -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
select * from tblTransaction
ROLLBACK TRAN
go


BEGIN TRAN
Alter Table tblTransaction
add Comments varchar(50) NULL
GO --DDL

MERGE INTO tblTransaction as T -- DML
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED AND t.Amount + s.Amount  > 0 THEN 
		UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updaded Row'
WHEN MATCHED THEN
		DELETE 
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber, Comments)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
		UPDATE SET Comments = 'Unchanged'
OUTPUT inserted.*, deleted.*, $action
; -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
select * from tblTransaction
ROLLBACK TRAN
go

-- akcja - OUTPUT  $action - dzia³a tylko z MERGE


BEGIN TRAN
Alter Table tblTransaction
add Comments varchar(50) NULL
GO --DDL

MERGE TOP (5) PERCENT INTO tblTransaction as T -- DML
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED AND t.Amount + s.Amount  > 0 THEN 
		UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updaded Row'
WHEN MATCHED THEN
		DELETE 
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber, Comments)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
		UPDATE SET Comments = 'Unchanged'
OUTPUT inserted.*, deleted.*, $action
; -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
select * from tblTransaction
ROLLBACK TRAN
go