
-- jawna trnasakcja
begin tran
select * 
from tblEmployee
commit tran


-- jawna trnasakcja
begin tran
update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123
rollback tran




-- to jest czêœæ transakcji nie jest pe³na bo nie jest zakoñczona
begin tran
update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
commit tran


begin tran
update tblEmployee
set EmployeeNumber = 123
where EmployeeNumber = 122

select * 
from tblEmployee
commit tran