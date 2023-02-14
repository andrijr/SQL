select 
1 as Tag -- przy explicit pierwsza kolumna musi byæ numer
, null as Parent -- te dwie piersze kolumny musisz mieæ
, e.EmployeeFirstName  as [Elements!1!EmployeeFirstName]
, e.EmployeeLastName as [Elements!1!EmployeeLastName]
, e.EmployeeNumber as [Elements!1!DateOfBirth]
, e.DateOfBirth as [Elements!1!EmployeeLastName]
, t.Amount as [Elements!1!Amount]
, t.DateOfTransaction as [Elements!1!DateOfTransaction]
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml explicit -- daje to xml w przypadku xml raw



select 
1 as Tag -- przy explicit pierwsza kolumna musi byæ numer
, null as Parent -- te dwie piersze kolumny musisz mieæ
, e.EmployeeFirstName  as [Elements!1!EmployeeFirstName]
, e.EmployeeLastName as [Elements!1!EmployeeLastName]
, e.EmployeeNumber as [Elements!1!EmployeeNumber]
, e.DateOfBirth as [Elements!1!DateOfBirth]
, null as [Elements!2!Amount]
, null as [Elements!2!DateOfTransaction]
from tblEmployee as e
where e.EmployeeNumber between 200 and 202
union all
select 
2 as Tag -- przy explicit pierwsza kolumna musi byæ numer
, null as Parent -- te dwie piersze kolumny musisz mieæ
, null  as [EmployeeFirstName]
, null as [EmployeeLastName]
, t.EmployeeNumber 
, null as DateOfBirth
, t.Amount
, t.DateOfTransaction
from tblTransaction as t
inner join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 200 and 202
for xml explicit -- daje to xml w przypadku xml raw




select 
1 as Tag -- przy explicit pierwsza kolumna musi byæ numer
, null as Parent -- te dwie piersze kolumny musisz mieæ
, e.EmployeeFirstName  as [Elements!1!EmployeeFirstName]
, e.EmployeeLastName as [Elements!1!EmployeeLastName]
, e.EmployeeNumber as [Elements!1!EmployeeNumber]
, e.DateOfBirth as [Elements!1!DateOfBirth]
, null as [Elements!2!Amount]
, null as [Elements!2!DateOfTransaction]
from tblEmployee as e
where e.EmployeeNumber between 200 and 202
union all
select 
2 as Tag -- przy explicit pierwsza kolumna musi byæ numer
, null as Parent -- te dwie piersze kolumny musisz mieæ
, null  as [EmployeeFirstName]
, null as [EmployeeLastName]
, t.EmployeeNumber 
, null as DateOfBirth
, t.Amount
, t.DateOfTransaction
from tblTransaction as t
inner join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 200 and 202
order by EmployeeNumber, [Elements!2!Amount]
for xml explicit -- daje to xml w przypadku xml raw



