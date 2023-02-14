-- must be in tblEmployee AND tblTransaction, and not 126-129
select *
from tblEmployee as e
join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber  in 
( select EmployeeNumber from tblEmployee where EmployeeLastName not like 'y%' )
order by e.EmployeeNumber

-- must be in tblEmployee, and not 126-129
select *
from tblEmployee as e
join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber  not in 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by e.EmployeeNumber




select *
from  tblTransaction as t
where t.EmployeeNumber  in 
( select EmployeeNumber from tblEmployee where EmployeeLastName not like 'y%' )
-- must be in tblEmployee AND tblTransaction, and not 126-129
-- INNER JOIN
order by t.EmployeeNumber


select *
from  tblTransaction as t
where t.EmployeeNumber  not in 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
-- must be in tblEmployee, and not 126-129
-- LEFT JOIN
order by t.EmployeeNumber