declare @date1 as datetime2 = '2022.02.02 01:10:10.456'
select @date1
go
declare @date1 as datetime2(2) = '2022.02.02 01:10:10.456'
select @date1

select convert(nvarchar(20), @date1)
select convert(nvarchar(20), @date1, 101)
select convert(nvarchar(20), @date1, 103)

select cast(@date1 as nvarchar(20))
select parse('Thursday, 25 June 2015' as date)
select parse(' 25 June 2015' as date)
select parse('Jueves, 25 de junio de 2015' as date using 'es-ES')

select format(cast('2022.02.02 01:10:10.456' as datetime2(2)), 'D')

select format(cast('2022.02.02 01:10:10.456' as datetime), 'd')
select format(cast('2022.12.02 01:10:10.456' as datetime), 'dd-MM-yy')
select format(cast('2022.12.02 01:10:10.456' as datetime), 'D', 'pl-pl')