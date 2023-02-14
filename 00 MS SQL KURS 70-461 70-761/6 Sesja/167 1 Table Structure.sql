select * from tblDepartment
select * from tblEmployee
select * from tblTransaction
--select * from tblAttendance


select min(EmployeeNumber) as MinNumber, max(EmployeeNumber) as MaxEmployeeNumber
from tblEmployee

select min(EmployeeNumber) as MinNumber, max(EmployeeNumber) as MaxEmployeeNumber
from tblTransaction


select min(e.EmployeeNumber) as MinNumber, max(e.EmployeeNumber) as MaxEmployeeNumber
from tblEmployee as e
inner join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber