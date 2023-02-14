select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
order by d.Department, e.EmployeeNumber


select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
order by d.Department, e.EmployeeNumber

-- zwraca b��d
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
where TheRank < 5
order by d.Department, e.EmployeeNumber


-- zwraca b��d
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
where rank() over ( partition by d.department order by e.EmployeeNumber)  < 5
order by d.Department, e.EmployeeNumber


-- zwraca b��d
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
where rank() over ( partition by d.department order by e.EmployeeNumber)  < 5
--order by d.Department, e.EmployeeNumber


-- zwraca b��d
select * from (
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
order by d.Department, e.EmployeeNumber ) MyTable



-- nie zwraca b��du
select * from (
select top(100) percent d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department
order by d.Department, e.EmployeeNumber ) MyTable

-- nie zwraca b��du ale to lepszy spos�b	
select * from (
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department ) MyTable
order by Department, EmployeeNumber 


select * from (
select d.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName 
, rank() over ( partition by d.department order by e.EmployeeNumber) as TheRank
from tblDepartment as d
join tblEmployee as e
on e.Department = d.Department ) MyTable
where TheRank <= 5
order by Department, EmployeeNumber 