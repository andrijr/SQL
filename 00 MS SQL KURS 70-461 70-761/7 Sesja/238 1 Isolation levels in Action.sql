begin tran
	update tblEmployee
	set EmployeeNumber = 122
	where EmployeeNumber = 123
waitfor delay '00:00:10'  -- czeka  10 sekund zanim przjdzie do nastêpnej transakcji
rollback tran


-- 3
begin tran
	update tblEmployee
	set EmployeeNumber = 123
	where EmployeeNumber = 122
commit tran