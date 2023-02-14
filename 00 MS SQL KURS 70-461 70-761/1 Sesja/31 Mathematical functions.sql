declare @myVar as decimal(10, 1) = 5
select @myVar + 1
select @myVar - 1
select @myVar * 2
select @myVar / 2
select power(@myVar , 2) -- do dowolnej potêgi
select SQUARE(@myVar) -- do kwadratu
select SQRT(@myVar) -- pierwiastek
select power(@myVar , 0.5) -- pierwiastek

GO
declare @myVar as numeric(10, 2) = 53.456
select FLOOR(@myVar)
select CEILING(@myVar)
select ROUND(@myVar, 2)	
set @myVar = -(@myVar)
select FLOOR(@myVar)
select CEILING(@myVar)
select ROUND(@myVar, 2)
select ROUND(@myVar, -1)
GO

select PI() as pi
select exp(1) as e

declare @myVar as numeric(10, 2) = 53.456
select abs(@myVar)
select sign(@myVar)

GO

select Rand(99)

