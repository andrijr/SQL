
begin tran MyTransaction 
select * 
from tblEmployee

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
rollback tran MyTransaction



begin tran MyTransaction WITH MARK -- Przypiszê nazwê transakcji w logu
select * 
from tblEmployee

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
rollback tran MyTransaction


begin tran MyTransaction WITH MARK 'My Transaction' -- Przypiszê nazwê transakcji w logu i mo¿esz daæ bardziej przyjazn¹ nazwê
select * 
from tblEmployee

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
rollback tran MyTransaction