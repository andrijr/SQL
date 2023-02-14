select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, convert(varchar(10), e.DateOfBirth) as DateOfBirth,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml raw , xmldata
go


-- i4 / int
-- boolean
-- datetime - datetime.iso8601
-- double
-- string	- varchar
-- null - nil

select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.DateOfBirth ,
t.Amount, t.DateOfTransaction
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber between 200 and 202
for xml raw , xmlschema
