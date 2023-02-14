select  e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
, ( select sum(Amount)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as TotalAmount		
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber



select *  , 
	( select EmployeeNumber from tblEmployee as e 
	where e.EmployeeLastName  like 'y%' and t.EmployeeNumber = e.EmployeeNumber ) as DoesIsExists
from tblTransaction as t
--where exists
order by EmployeeNumber


-- wariant 1
select *  
from tblTransaction as t
where exists
	( select EmployeeNumber from tblEmployee as e 
	where e.EmployeeLastName  like 'y%' and t.EmployeeNumber = e.EmployeeNumber )
order by EmployeeNumber

-- wariant 2
select t.*
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
--group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber


select *  
from tblTransaction as t
where not exists
	( select EmployeeNumber from tblEmployee as e 
	where e.EmployeeLastName  like 'y%' and t.EmployeeNumber = e.EmployeeNumber )
order by EmployeeNumber