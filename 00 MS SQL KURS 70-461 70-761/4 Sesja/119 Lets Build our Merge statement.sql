-- przeanalizowaæ sk³adnie

BEGIN TRAN
MERGE INTO tblTransaction as T
USING  [dbo].[tblTransactionNew] as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
		UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber); -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
ROLLBACK TRAN
go

-- za³o¿yliœmy ¿e 1 wiersz w tblTransaction oraz 1 wiersz w tblTransactionNew
-- natomiast mamy 1 wiersz w tblTransaction oraz wielie wierszy w tblTransactionNew


select EmployeeNumber, DateOfTransaction, count(*) as NumberOfRows
from tblTransaction
group by EmployeeNumber, DateOfTransaction
having count(*) >1
order by EmployeeNumber, DateOfTransaction
go



select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction


BEGIN TRAN
MERGE INTO tblTransaction as T
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
		UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber); -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
ROLLBACK TRAN
go


DISABLE TRIGGER tr_tblTransaction ON [dbo].[tblTransaction]


BEGIN TRAN
MERGE INTO tblTransaction as T
USING  (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransaction
group by EmployeeNumber, DateOfTransaction ) as S
ON T.EmployeeNumber = S.EmployeeNumber
and T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
		UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
		INSERT (Amount, DateOfTransaction, EmployeeNumber)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber); -- znak œrednika na koñcu w instrukcji MERGE jest obowi¹zkowy
ROLLBACK TRAN
go


BEGIN TRAN
MERGE INTO tblTransaction as T
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