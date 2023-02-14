select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml path


select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml path('Employees')


select 
  e.EmployeeFirstName as '@EmployeeFirstName'  -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeLastName as '@EmployeeLastName' -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeNumber
, e.DateOfBirth 
, t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml path('Employees')




select 
  e.EmployeeFirstName as '@EmployeeFirstName'  -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeLastName as '@EmployeeLastName' -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeNumber
, e.DateOfBirth 
, t.Amount as 'Transaction/Amount'
, t.DateOfTransaction as 'Transaction/DateOfTransaction'
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml path('Employees')


select 
  e.EmployeeFirstName -- as '@EmployeeFirstName'  -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeLastName --as '@EmployeeLastName' -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeNumber
, e.DateOfBirth 
, ( select t.Amount as 'Amount' 
	from dbo.tblTransaction as t 
	where t.EmployeeNumber = e.EmployeeNumber 
	for xml path('') ) as TransactionElement
from tblEmployee as e
where e.EmployeeNumber between 200 and 202
for xml path('Elements')


select 
  e.EmployeeFirstName -- as '@EmployeeFirstName'  -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeLastName --as '@EmployeeLastName' -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeNumber
, e.DateOfBirth 
, ( select t.Amount as 'Amount' 
	from dbo.tblTransaction as t 
	where t.EmployeeNumber = e.EmployeeNumber 
	for xml path(''), type ) as TransactionElement
from tblEmployee as e
where e.EmployeeNumber between 200 and 202
for xml path('Elements')


select 
  e.EmployeeFirstName -- as '@EmployeeFirstName'  -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeLastName --as '@EmployeeLastName' -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeNumber
, e.DateOfBirth 
, ( select t.Amount as 'Amount' 
	from dbo.tblTransaction as t 
	where t.EmployeeNumber = e.EmployeeNumber 
	for xml path(''), type ) as TransactionElement
from tblEmployee as e
where e.EmployeeNumber between 200 and 202
for xml path('Elements'), root('MyXML')


select 
  e.EmployeeFirstName  as '@EmployeeFirstName'  -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeLastName as '@EmployeeLastName' -- @ ustawia ¿e to atrybuty i musz¹ byæ na pierwszym miejscu przed elementami
, e.EmployeeNumber
, e.DateOfBirth 
, ( select t.Amount as 'Amount' 
	from dbo.tblTransaction as t 
	where t.EmployeeNumber = e.EmployeeNumber 
	for xml path(''), type ) as TransactionElement
from tblEmployee as e
where e.EmployeeNumber between 200 and 202
for xml path('Elements'), root('MyXML')