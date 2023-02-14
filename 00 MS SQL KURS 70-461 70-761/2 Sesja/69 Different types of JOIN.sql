
--INNER JOIN - default - has to be in both
--LEFT JOIN - all the rows in the left table
--RIGHT JOIN - all the rows in the right table
-- FULL JOIN - all the rows in the left and Right table
-- CROSS JOIN - all on all




select *
from  tblEmployee
where EmployeeNumber = 1046

select *
from  tblTransaction
where EmployeeNumber = 1046

select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as Amount
from tblEmployee 
left join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
order by EmployeeNumber

select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as Amount
from tblEmployee 
right join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
order by EmployeeNumber

select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as Amount
from tblEmployee 
full join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
order by EmployeeNumber


