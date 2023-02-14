
-- ustanawia b�okad� na ca�� tabele na czas wykonania
begin tran
select *  from tblEmployee
commit tran


begin tran
	update tblEmployee
	set EmployeeNumber = 122
	where EmployeeNumber = 123
waitfor delay '00:00:10'  -- czeka 10 sekund zanim przjdzie do nast�pnej transakcji
rollback tran



begin tran
	update tblEmployee
	set EmployeeNumber = 122
	where EmployeeNumber = 123
waitfor time '00:00:10'  -- czeka do 10 min po p�nocy zanim przjdzie do nast�pnej transakcji
rollback tran
