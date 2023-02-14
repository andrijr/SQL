select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml auto


select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml auto, elements 
