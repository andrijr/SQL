select * from (
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department ) as MyTable
where TheRank <= 5
order by Department, EmployeeNumber 
go


With 
MyTable as
(select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department )

select * 
from MyTable
where TheRank <= 5
order by Department, EmployeeNumber 
go


With 
MyTable as
(select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department )
, Transaction2014 as
( select * from tblTransaction where DateOfTransaction < '2015-01-01' )


select * 
from MyTable
where TheRank <= 5
order by Department, EmployeeNumber 
go



With 
MyTable as
(select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department )
, Transaction2014 as
( select * from tblTransaction where DateOfTransaction < '2015-01-01' )


select * 
from MyTable
left join Transaction2014
on MyTable.EmployeeNumber = Transaction2014.EmployeeNumber
where TheRank <= 5
order by Department, MyTable.EmployeeNumber 
go