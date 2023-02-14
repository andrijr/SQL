
select *
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


select *
from tblTransaction as t
join ( select * from tblEmployee as e where e.EmployeeLastName  like 'y%' ) as e
on e.EmployeeNumber = t.EmployeeNumber
order by e.EmployeeNumber


select * from tblEmployee as e where e.EmployeeLastName  like 'y%'





select *
from tblTransaction as t
left join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


select *
from tblTransaction as t
left join ( select * from tblEmployee as e where e.EmployeeLastName  like 'y%' ) as e
on e.EmployeeNumber = t.EmployeeNumber
order by e.EmployeeNumber


select *
from tblTransaction as t
left join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
and e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber
