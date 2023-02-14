

--select * from myTable
--PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt

--select * from myTable
--UNPIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myUnPvt



select * from 
( select year(DateOfTransaction) as TheYaer,  month(DateOfTransaction) as TheMonth, Amount from tblTransaction ) 
as myTable
PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt
order by TheYaer
go


with 
myTable as
( select year(DateOfTransaction) as TheYaer, month(DateOfTransaction) as TheMonth, Amount from tblTransaction )

select * from myTable
PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt
order by TheYaer
go


with 
myTable as
( select year(DateOfTransaction) as TheYaer, month(DateOfTransaction) as TheMonth, Amount from tblTransaction )

select TheYaer, [1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12]  from myTable
PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt
order by TheYaer
go


with 
myTable as
( select year(DateOfTransaction) as TheYaer, month(DateOfTransaction) as TheMonth, Amount from tblTransaction 
union
select 2016, 2, 0)

select TheYaer, [1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12]  from myTable
PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt
order by TheYaer
go



with 
myTable as
( select year(DateOfTransaction) as TheYaer, month(DateOfTransaction) as TheMonth, Amount from tblTransaction )

select TheYaer, isnull([1], 0) as [1],
isnull([2], 0) as [2],
isnull([3], 0) as [3],
isnull([4], 0) as [4],
isnull([5], 0) as [5],
isnull([6], 0) as [6],
isnull([7], 0) as [7],
isnull([8], 0) as [8],
isnull([9], 0) as [9],
isnull([10], 0) as [10],
isnull([11], 0) as [11],
isnull([12], 0) as [12]
from myTable
PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt
order by TheYaer
go


-- zmniejszamy ilosæ danych do minimóm przed obracaniem tabeli to u³atwia debugowanie
with 
myTable as
( select year(DateOfTransaction) as TheYaer, month(DateOfTransaction) as TheMonth, sum(Amount) as Amount from tblTransaction 
group by year(DateOfTransaction) , month(DateOfTransaction) )

select TheYaer, isnull([1], 0) as [1],
isnull([2], 0) as [2],
isnull([3], 0) as [3],
isnull([4], 0) as [4],
isnull([5], 0) as [5],
isnull([6], 0) as [6],
isnull([7], 0) as [7],
isnull([8], 0) as [8],
isnull([9], 0) as [9],
isnull([10], 0) as [10],
isnull([11], 0) as [11],
isnull([12], 0) as [12]
from myTable
PIVOT ( sum(Amount) for TheMonth in ([1], [2] ,[3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ) ) as myPvt
order by TheYaer
go
