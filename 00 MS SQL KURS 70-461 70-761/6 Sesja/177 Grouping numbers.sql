 -- do przeanalizowania
 With
Numbers as
( select top (select max(EmployeeNumber) from tblTransaction) ROW_NUMBER() over ( order by (select null) ) as RowNumber
from tblTransaction ),
Transaction2014 as
( select * from tblTransaction where DateOfTransaction >= '2014-01-01' and DateOfTransaction < '2015-01-01' )

select n.RowNumber, 
		LAG(RowNumber) over (order by RowNumber )as PreviousRowNumber , 
		LEAD(RowNumber) over(order by RowNumber) as NextRowNumber
from Numbers n
left join Transaction2014 t
on n.RowNumber = t.EmployeeNumber
where t.EmployeeNumber is null
order by n.RowNumber
go


 With
Numbers as
( select top (select max(EmployeeNumber) from tblTransaction) ROW_NUMBER() over ( order by (select null) ) as RowNumber
from tblTransaction ),
Transaction2014 as
( select * from tblTransaction where DateOfTransaction >= '2014-01-01' and DateOfTransaction < '2015-01-01' ),
tblGap as 
( select n.RowNumber, 
		RowNumber -LAG(RowNumber) over (order by RowNumber ) as PreviousRowNumber , 
		LEAD(RowNumber) over(order by RowNumber) - RowNumber as NextRowNumber,
		case when RowNumber -LAG(RowNumber) over (order by RowNumber ) = 1 then 0 else 1 end GroupGap
from Numbers n
left join Transaction2014 t
on n.RowNumber = t.EmployeeNumber
where t.EmployeeNumber is null
--order by n.RowNumber 
)

select *, sum(GroupGap) over (order by Rownumber) as TheGroup
from tblGap
go



 With
Numbers as
( select top (select max(EmployeeNumber) from tblTransaction) ROW_NUMBER() over ( order by (select null) ) as RowNumber
from tblTransaction ),
Transaction2014 as
( select * from tblTransaction where DateOfTransaction >= '2014-01-01' and DateOfTransaction < '2015-01-01' ),
tblGap as 
( select n.RowNumber, 
		RowNumber -LAG(RowNumber) over (order by RowNumber ) as PreviousRowNumber , 
		LEAD(RowNumber) over(order by RowNumber) - RowNumber as NextRowNumber,
		case when RowNumber -LAG(RowNumber) over (order by RowNumber ) = 1 then 0 else 1 end GroupGap
from Numbers n
left join Transaction2014 t
on n.RowNumber = t.EmployeeNumber
where t.EmployeeNumber is null),
tblGroup as
( select *, sum(GroupGap) over (order by Rownumber) as TheGroup
from tblGap ) 

select TheGroup, Min(RowNumber) as MinRowNumber , Max(RowNumber) as MaxRowNumber, 
Max(RowNumber) - Min(RowNumber) + 1 as NumberEmployees
from tblGroup
group by TheGroup
order by TheGroup