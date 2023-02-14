begin tran

alter table tblemployee
add Manager int
--go

update tblEmployee
set Manager = ((EmployeeNumber - 123) / 10 ) + 123 
where EmployeeNumber > 123 

select * from tblEmployee
rollback tran



begin tran
alter table tblemployee
add Manager int
go

update tblEmployee
set Manager = ((EmployeeNumber - 123) / 10 ) + 123 
where EmployeeNumber > 123 

select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.Manager ,
	   m.EmployeeNumber as ManagerNumber, m.EmployeeFirstName as ManageFirstName, m.EmployeeLastName as ManagerLastName, m.Manager	

from tblEmployee e
left join tblEmployee m
on e.Manager = m.EmployeeNumber  
rollback tran
 