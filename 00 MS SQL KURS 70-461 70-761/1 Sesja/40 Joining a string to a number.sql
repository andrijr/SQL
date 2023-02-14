select 'My number: ' + 456
go
select 'My salary: ' + convert(varchar(10), 9566) -- works,but not well
select 'My salary: ' + cast(9566 as varchar(10)) -- działa ale nie zbyt dobrze

select 'My salary: ' + format(9656, 'C')

select [name] + 'A'
from sys.all_columns

select [name] + N'Ⱥ'
from sys.all_columns

select substring([name],2,len([name])-1) as [name]
from sys.all_columns

select substring([name],1,len([name])-1) as [name]
from sys.all_columns