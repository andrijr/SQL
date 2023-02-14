
select EmployeeNumber , sum(Amount)
from tblTransaction
group by EmployeeNumber


select *
from tblTransaction


select *
from  tblEmployee

select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as Amount
from tblEmployee 
join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
order by EmployeeNumber

select *
from  tblEmployee
where EmployeeNumber = 1046

select *
from  tblTransaction
where EmployeeNumber = 1046


