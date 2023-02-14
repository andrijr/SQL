
select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  
where e.EmployeeNumber between 340 and 349   -- SARG - zapewnia bardziej wydajne kodowanie 

select EmployeeNumber, DateOfTransaction, Amount
, sum (amount) over(partition by EmployeeNumber order by DateOfTransaction ) as TotalAmount
from tblTransaction