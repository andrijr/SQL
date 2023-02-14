
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



CREATE or ALTER FUNCTION dbo.TransList ( @EmployeeNumber int )
RETURNS @TransList TABLE 
( Amount smallmoney,
 DateOfTransaction smalldatetime,
 EmployeeNumber int ) 
AS
BEGIN
    INSERT INTO @TransList (Amount, DateOfTransaction, EmployeeNumber )
	SELECT Amount, DateOfTransaction, EmployeeNumber  from tblTransaction
	where EmployeeNumber = @EmployeeNumber
    RETURN 
END
go


-- która szybsza Iline Table czy Multi Table
-- w tym przypadku szybsza Mutli Table
-- 15% obci¹¿enia
select * 
from dbo.TransList(123)

-- 85% obci¹¿enia
select * 
from dbo.TransactionList(123)

select * 
from tblTransaction
where EmployeeNumber = 123