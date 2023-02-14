begin tran
select * from ViewByDepartment
delete from ViewByDepartment
where Amount = 999.99 and EmployeeNumber = 132
-- nie mo¿na usun¹æ bo widok sk³ada siê z kilkutabel i usuniêcie mog³o by usunaæ z wielu tabel
go

create or alter view ViewSimple as
select * from tblTransaction where EmployeeNumber between 1 and 139
go

-- mo¿na usun¹æ w wdioku je¿eli widok jest oparty na jednej tabeli
begin tran
select * from ViewSimple where EmployeeNumber = 139
delete from ViewSimple
where Amount = 999.99 and EmployeeNumber = 139
select * from ViewSimple where EmployeeNumber = 139
rollback tran



begin tran
select * from ViewSimple where EmployeeNumber = 139
select * from tblTransaction where EmployeeNumber = 139
delete from ViewSimple
where  EmployeeNumber = 139
select * from ViewSimple where EmployeeNumber = 139
select * from tblTransaction where EmployeeNumber = 139
rollback tran


-- nie usunelo poniewa¿ widok jest poza zakresem
begin tran
select * from ViewSimple where EmployeeNumber = 140
select * from tblTransaction where EmployeeNumber = 140
delete from ViewSimple
where  EmployeeNumber = 140
select * from ViewSimple where EmployeeNumber = 140
select * from tblTransaction where EmployeeNumber = 140
rollback tran