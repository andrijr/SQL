
begin tran MyTransaction 
select * 
from tblEmployee

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
rollback tran MyTransaction



begin tran MyTransaction WITH MARK -- Przypisz� nazw� transakcji w logu
select * 
from tblEmployee

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
rollback tran MyTransaction


begin tran MyTransaction WITH MARK 'My Transaction' -- Przypisz� nazw� transakcji w logu i mo�esz da� bardziej przyjazn� nazw�
select * 
from tblEmployee

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

select * 
from tblEmployee
rollback tran MyTransaction