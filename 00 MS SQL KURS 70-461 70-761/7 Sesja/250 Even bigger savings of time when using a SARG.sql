-- SARG - Search ARGuments
-- SARG - zapewnia bardziej wydajne kodowanie

-- 35%
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  -- Merge Join 

-- 65%
select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  -- Hash Match 



-- 23%
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  -- Nested Loops 
where e.EmployeeNumber = 135

-- 77%
select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  -- Nested Loops 
where e.EmployeeNumber = 135





select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where year(e.DateOfBirth) = '1975' -- to nie jest SARG

select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.DateOfBirth >= '1975-01-01' and e.DateOfBirth < '1976-01-01' -- SARG - zapewnia bardziej wydajne kodowanie



select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  
where year(e.DateOfBirth) = '1975' -- to nie jest SARG

select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.DateOfBirth >= '1975-01-01' and e.DateOfBirth < '1976-01-01' -- SARG - zapewnia bardziej wydajne kodowanie



select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where substring(e.EmployeeFirstName , 1, 4) = 'John' -- to nie jest SARG

select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeFirstName like 'John%' -- SARG - zapewnia bardziej wydajne kodowanie



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




-- 41%
select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber between 340 and 349   -- SARG - zapewnia bardziej wydajne kodowanie 

-- 59%
select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber / 10 = 34  -- to nie jest SARG