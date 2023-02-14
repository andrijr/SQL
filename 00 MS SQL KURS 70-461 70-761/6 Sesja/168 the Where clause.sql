select count(*) from tblEmployee
select count(*) from tblTransaction

select count(*), min(e.EmployeeNumber) as MinNumber, max(e.EmployeeNumber) as MaxEmployeeNumber
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber

select count(*), min(e.EmployeeNumber) as MinNumber, max(e.EmployeeNumber) as MaxEmployeeNumber
from tblEmployee as e
right join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber

select count(*),  min(e.EmployeeNumber) as MinNumber, max(e.EmployeeNumber) as MaxEmployeeNumber
from tblEmployee as e
inner join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber


select *
from tblEmployee as e
join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber



select *
from tblEmployee as e
join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber  in (126, 127, 128, 129)
order by e.EmployeeNumber


select *
from tblEmployee as e
join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber  in ( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by e.EmployeeNumber
