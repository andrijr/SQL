begin tran
update dbo.tblEmployee
set Department = 'Commercial'
where EmployeeNumber = 130

rollback tran