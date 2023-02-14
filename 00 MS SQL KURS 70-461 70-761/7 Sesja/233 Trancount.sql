select * 
from tblEmployee
begin tran
	begin tran
		update tblEmployee
		set EmployeeNumber = 122
		where EmployeeNumber = 123
	commit tran
commit tran
select * 
from tblEmployee



update tblEmployee
set EmployeeNumber = 123
where EmployeeNumber = 122

select * 
from tblEmployee


-- transakcja bêdzie wycofana
select * 
from tblEmployee
begin tran
	begin tran
		update tblEmployee
		set EmployeeNumber = 122
		where EmployeeNumber = 123
	commit tran
rollback tran
select * 
from tblEmployee


-- bêdzie bl¹d
select * 
from tblEmployee
begin tran
	begin tran
		update tblEmployee
		set EmployeeNumber = 122
		where EmployeeNumber = 123
	rollback tran
commit tran
select * 
from tblEmployee



-- rollback
select * 
from tblEmployee
select @@TRANCOUNT -- 0
begin tran
	select @@TRANCOUNT -- 1
	begin tran
		update tblEmployee
		set EmployeeNumber = 122
		where EmployeeNumber = 123
		select @@TRANCOUNT -- 2
	rollback tran
	select @@TRANCOUNT -- 0
IF @@TRANCOUNT > 0 -- No
commit tran 
select @@TRANCOUNT -- 0
select * 
from tblEmployee


-- commit
select * 
from tblEmployee
select @@TRANCOUNT -- 0
begin tran
	select @@TRANCOUNT -- 1
	begin tran
		update tblEmployee
		set EmployeeNumber = 122
		where EmployeeNumber = 123
		select @@TRANCOUNT -- 2
	commit tran
	select @@TRANCOUNT -- 1
IF @@TRANCOUNT > 0 -- Yes
commit tran 
select @@TRANCOUNT -- 0
select * 
from tblEmployee