alter table tblEmployee
ADD Constraint unqGovernmentID UNIQUE (EmployeeGovernmentID);
-- nazwa ograniczenia oraz nazwa kolumny lub kolumn które s¹ ograniczone


select EmployeeGovernmentID, count(EmployeeGovernmentID) as myCount
from tblEmployee
group by EmployeeGovernmentID
having count(EmployeeGovernmentID) > 1

select * from tblEmployee where EmployeeGovernmentID IN ('AB123456G')

begin tran
delete from tblEmployee
output deleted.*
where EmployeeNumber IN(  125, 126) and EmployeeGovernmentID IN ('AB123456G')
commit tran
--rollback tran

-- przyk³ad z top
begin tran
delete top(2) from tblEmployee
output deleted.*
where EmployeeGovernmentID IN ('AB123456G')
rollback tran


alter table tblTransaction
add constraint unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber);

select * from tblTransaction
where EmployeeNumber = 131

delete from tblTransaction
where EmployeeNumber = 131

insert into tblTransaction
Values (131, 1, '2015-01-01')
insert into tblTransaction
Values (131, 1, '2015-01-01')

alter table tblTransaction
drop constraint unqTransaction

create table tblTransaction2
(Amount smallmoney not null,
DateOfTransaction smallmoney not null,
EmployeeNumber int not null,
Constraint unqTransaction2 unique (Amount, DateOfTransaction, EmployeeNumber))

drop table tblTransaction2

