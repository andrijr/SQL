
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



IF OBJECT_ID(N'dbo.NumberOfTransaction', N'FN') is not null
drop FUNCTION dbo.NumberOfTransaction
go

-- FN funkcja
-- U Tabela
-- V vidok
-- P procedura

IF exists (select * from sys.objects where name = 'NumberOfTransaction' ) 
drop FUNCTION dbo.NumberOfTransaction
go


CREATE or ALTER FUNCTION NumberOfTransaction (  @EmployeeNumber int )
RETURNS int
as
BEGIN
	Declare @NumberOfTransaction int
	select @NumberOfTransaction = count(*) from tblTransaction
	where EmployeeNumber = @EmployeeNumber
	RETURN @NumberOfTransaction
END
go


-- jak szybkie to jest
-- generalnie funkcje mog¹ byæ szybsze ale w tym przypadku tak nie jest

-- 48%
select EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department , dbo.NumberOfTransaction(EmployeeNumber) as TransNum
from tblEmployee

-- 13%
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.Department
, count(*) as TransNum 
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.Department
 
 -- 27%
select distinct e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.Department
, count(*) over ( partition by e.EmployeeNumber ) as TransNum 
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber

-- 13%
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.Department
, ( select count(*) from tblTransaction as t where t.EmployeeNumber = e.EmployeeNumber) as TransNum 
from tblEmployee as e


