
select left(EmployeeLastName, 1) as Initial , count(*) as number
from tblEmployee
group by left(EmployeeLastName, 1)
order by left(EmployeeLastName, 1)

select left(EmployeeLastName, 1) as Initial , count(*) as number
from tblEmployee
group by left(EmployeeLastName, 1)
order by count(*) DESC

select TOP (5) left(EmployeeLastName, 1) as Initial , count(*) as number
from tblEmployee
group by left(EmployeeLastName, 1)
order by count(*) DESC

select left(EmployeeLastName, 1) as Initial , count(*) as number
from tblEmployee
where 1=1
group by left(EmployeeLastName, 1)
having count(*) > 40
order by count(*) DESC

select left(EmployeeLastName, 1) as Initial , count(*) as number
from tblEmployee
where 1=1
group by left(EmployeeLastName, 1)
having count(*) > 40
order by number DESC


Update tblEmployee
Set EmployeeMiddleName = NULL
Where EmployeeMiddleName = ''