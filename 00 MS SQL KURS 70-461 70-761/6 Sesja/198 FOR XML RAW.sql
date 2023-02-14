select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml raw 


select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml raw('MyRow')


select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml raw('MyRow'), type -- zmienia typ danych



select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml raw('MyRow'), elements -- konwertowanie danych jak elementy -- domyœlnie konwertuje jak atrybuty

