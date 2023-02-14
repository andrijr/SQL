begin tran
	update tblEmployee
	set EmployeeNumber = 123
	where EmployeeNumber = 122
rollback tran

select * 
from tblEmployee
