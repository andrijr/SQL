-- REcursive CTE
begin tran
alter table tblemployee
add Manager int
go

update tblEmployee
set Manager = ((EmployeeNumber - 123) / 10 ) + 123 
where EmployeeNumber > 123 
; -- ; or go -- jeœli jest to CTE œrednik jest obowi¹zkowy

with
myTable as
( select EmployeeNumber , EmployeeFirstName, EmployeeLastName, 0 as BossLevel
from tblEmployee 
where Manager is null )

select * from myTable
rollback tran
 



 -- REcursive CTE
begin tran
alter table tblemployee
add Manager int
go

update tblEmployee
set Manager = ((EmployeeNumber - 123) / 10 ) + 123 
where EmployeeNumber > 123 
; -- ; or go -- jeœli jest to CTE œrednik jest obowi¹zkowy

with
myTable as
( select EmployeeNumber , EmployeeFirstName, EmployeeLastName, 0 as BossLevel -- Anchor -- Kotwica
from tblEmployee 
where Manager is null -- zakotwiczona tablica
union all
select e.EmployeeNumber , e.EmployeeFirstName, e.EmployeeLastName, myTable.BossLevel + 1 as BossLevel -- Recursive
from tblEmployee as e
join myTable 
on myTable.EmployeeNumber = e.Manager
) -- Recursive CTE

select * from myTable
rollback tran
 