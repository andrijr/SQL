
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


-- Scalar Funkcja przeznaczone s¹ dla pojedynczych wartoœci - zwraca pojedncz¹ wartoœæ

IF OBJECT_ID(N'dbo.AmountPlusOne', N'FN') is not null
drop FUNCTION dbo.AmountPlusOne
go

-- FN funkcja
-- U Tabela
-- V vidok
-- P procedura

IF exists (select * from sys.objects where name = 'AmountPlusOne' ) 
drop FUNCTION dbo.AmountPlusOne
go


CREATE FUNCTION AmountPlusOne (  @Amount smallmoney )
RETURNS smallmoney
AS
BEGIN

    RETURN @Amount  + 1

END
GO


select DateOfTransaction , EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountAndOne
from tblTransaction 



declare @myValue smallmoney
EXEC @myValue = dbo.AmountPlusOne 345.67
select @myValue
go

declare @myValue smallmoney
EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67
select @myValue

-- procedukra jest wykonywana w pewnych okolicznoœciach
