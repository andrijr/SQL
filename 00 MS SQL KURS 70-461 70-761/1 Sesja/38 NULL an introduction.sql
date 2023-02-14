declare @myVar as int
--set @myVar = 4
select @myVar

select CONVERT(decimal(5,2), 100)
select CONVERT(decimal(5,2), 1000)
select try_CONVERT(decimal(5,2), 1000)

select cast(100 as decimal(5,2))
select cast(1000 as decimal(5,2))
select try_cast(1000 as decimal(5,2))

select 'f' + 's' + 's'

go
declare @myVar int = null
select @myVar
select iif(@myVar is null , 'no', 'yes')
select case when @myVar is null then 'no' else 'yes' end
select '5'  + coalesce(@myVar, '') + '5'
select coalesce(null, '')
-- najlepsza opcja do ³¹czenia to concat
select concat('3', null, 's')
select concat_ws('-', null, 's', '3')