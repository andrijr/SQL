
-- Scalar Function
--CREATE FUNCTION dbo.FunctionName ( @param1 int, 	@param2 int )
--RETURNS INT
--AS
--BEGIN
--    RETURN @param1 + @param2
--END

-- Inline Table Function
--CREATE FUNCTION dbo.FunctionName ( @param1 int, @param2 char(5) )
--RETURNS TABLE AS RETURN
--				( SELECT @param1 AS c1,  @param2 AS c2 )


-- Multi Table Function
--CREATE FUNCTION dbo.FunctionName ( @param1 int,  @param2 char(5) )
--RETURNS @returntable TABLE 
--					( [c1] int, [c2] char(5) )
--AS
--BEGIN
--    INSERT @returntable
--    SELECT @param1, @param2
--    RETURN 
--END

IF OBJECT_ID(N'dbo.TransactionList', N'IF') is not null
drop function dbo.TransactionList
go

if exists (select * from sys.objects where name = 'TransactionList' )
drop function dbo.TransactionList
go


CREATE or ALTER FUNCTION dbo.TransactionList ( @EmployeeNumber int   )
RETURNS TABLE AS RETURN
(
    SELECT * from tblTransaction
	where EmployeeNumber = @EmployeeNumber
)
go

-- zwraca b³¹d
select dbo.TransactionList(123)


select * 
from dbo.TransactionList(123)

select * 
from tblTransaction
where EmployeeNumber = 123


select * 
from tblEmployee
where exists ( select * from dbo.TransactionList(EmployeeNumber) )


select * 
from tblEmployee as e
where exists ( select * from tblTransaction as t where t.EmployeeNumber = e.EmployeeNumber )

select distinct e.*
from tblEmployee as e
join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber