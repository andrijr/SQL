select * from tblEmployee where EmployeeNumber = 3
select * from tblEmployee where EmployeeNumber = 194
select * from tblTransaction where EmployeeNumber = 3
select * from tblTransaction where EmployeeNumber = 194

begin tran
delete tblTransaction
from tblTransaction
where EmployeeNumber = 3
rollback tran


begin tran
select * from tblTransaction where EmployeeNumber = 194

update tblTransaction
set EmployeeNumber = 194
from tblTransaction
where EmployeeNumber = 3 -- between 3 and 5 -- in ( 3, 5) 

select * from tblTransaction where EmployeeNumber = 194
rollback tran


begin tran
--select * from tblTransaction where EmployeeNumber = 194

update tblTransaction
set EmployeeNumber = 194
output inserted.*, deleted.*
from tblTransaction
where EmployeeNumber = 3 -- between 3 and 5 -- in ( 3, 5) 

--select * from tblTransaction where EmployeeNumber = 194
rollback tran

