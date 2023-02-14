USE [70-461];

DECLARE @myvar as int = 2

--DECLARE @myvar as int
--SET @myvar = 2

select @myvar as myVariable

SET @myvar = 3
select @myvar as myVariable

SET @myvar = @myvar + 3
select @myvar as myVariable

 --przycina do ca³kowitych bo zmienna jest typu int
SET @myvar = 3.5
select @myvar as myVariable

