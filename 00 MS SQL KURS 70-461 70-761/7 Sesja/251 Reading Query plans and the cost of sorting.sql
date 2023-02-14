
-- 35%
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber between 340 and 349   -- SARG - zapewnia bardziej wydajne kodowanie 

-- 65%
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber / 10 = 34  -- to nie jest SARG




-- 23%
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber between 340 and 349   -- SARG - zapewnia bardziej wydajne kodowanie 

-- 77%
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber / 10 = 34  -- to nie jest SARG
order by t.Amount