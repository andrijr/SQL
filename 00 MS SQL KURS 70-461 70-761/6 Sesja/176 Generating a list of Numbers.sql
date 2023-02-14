select * from tblEmployee
order by EmployeeNumber

select * from tblTransaction
order by EmployeeNumber


select e.EmployeeNumber
from tblEmployee e
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber is null
order by e.EmployeeNumber
go


-- do przeanalizowania
With
Numbers as
( select top (1125) ROW_NUMBER() over ( order by (select null) ) as RowNumber
from tblTransaction )

select * from Numbers n
left join tblTransaction t
on n.RowNumber = t.EmployeeNumber
where t.EmployeeNumber is null
order by n.RowNumber


select *
from sys.objects o 
cross join  sys.objects u 

select 147  * 147
go


select top (select max(EmployeeNumber) from tblTransaction) ROW_NUMBER() over ( order by (select null) ) as RowNumber
from tblTransaction 

