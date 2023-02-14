alter table tblTransaction
add constraint chkAmount check (Amount >-1000 and Amount < 1000)

select * from tblTransaction

begin tran
insert into tblTransaction
output inserted.*
values (1, 1010, '2015-01-01')
rollback tran


begin tran
insert into tblTransaction
output inserted.*
values (1, 101, '2015-01-01')
rollback tran

alter table tblEmployee with nocheck -- dodawaj ograniczenie bez sprawdzenia
add constraint chkMiddleName check 
(Replace (EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)

alter table tblEmployee
drop constraint chkMiddleName

select * from tblEmployee

begin tran
insert into tblEmployee
output inserted.*
values (2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts')
rollback tran

alter table tblEmployee with nocheck -- dodawaj ograniczenie bez sprawdzenia
add constraint chkMiddleName check 
(Replace (EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)

begin tran
insert into tblEmployee
output inserted.*
values (2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts')
rollback tran

alter table tblEmployee with nocheck -- dodawaj ograniczenie bez sprawdzenia
add constraint chkDateOfBirth check (DateOfBirth between '1900-01-01' and getdate())

begin tran
insert into tblEmployee
output inserted.*
values (2003, 'A', 'B', 'C', 'D', '2014-01-01', 'Accounts')
rollback tran

begin tran
insert into tblEmployee
output inserted.*
values (2003, 'A', 'B', 'C', 'D', '2114-01-01', 'Accounts')
rollback tran


-- mo¿e byæ bez przecinku przed check
create table tblEmployee2 
(EmployeeMiddleName varchar(50) null check 
(Replace(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)
)

drop table tblEmployee2
-- trzeba usun¹æ constraint

-- mo¿e byæ z przecinkiem przed check
create table tblEmployee2 
(EmployeeMiddleName varchar(50) null , check 
(Replace(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)
)


-- liepiej dodaæ nazwê constraint 
create table tblEmployee2 
(EmployeeMiddleName varchar(50) null ,
constraint  tblEmployee2_chEmployeeMiddleName check
(Replace(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)
)

drop table tblEmployee2

alter table tblEmployee
drop chkDateOfBirth

alter table tblEmployee
drop chkMiddleName

alter table tblTransaction
drop chkAmount


