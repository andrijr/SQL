alter table tblTransaction
add  DateOfEntry datetime 

-- dodajemy nowe ogranieczenie
alter table tblTransaction
add constraint defDateOfEntry Default getdate() for DateOfEntry

begin tran 
delete from tblTransaction 
output deleted.*
where EmployeeNumber <3
--rollback tran
commit tran

insert into tblTransaction (EmployeeNumber, Amount, DateOfTransaction)
values(1, 10,'2014-01-01')
insert into tblTransaction (EmployeeNumber, Amount, DateOfTransaction, DateOfEntry)
values(2, 20,'2014-01-02', '2013-01-01')

select * from tblTransaction 
where EmployeeNumber <3

insert into tblTransaction (EmployeeNumber, Amount, DateOfTransaction)
values(1, 10,'2014-01-01')
select * from tblTransaction 
where EmployeeNumber <3

IF OBJECT_ID('dbo.tblTransaction2', 'U') IS NOT NULL 
drop table dbo.tblTransaction2

create table tblTransaction2
(EmployeeNumber int not null
, Amount smallmoney not null
, DateOfTransaction smalldatetime not null
, DateOfEntry datetime null constraint tblTransaction2_defDateOfEntry default getdate() )

insert into tblTransaction2 (EmployeeNumber, Amount, DateOfTransaction)
values(1, 10,'2014-01-01')
insert into tblTransaction2 (EmployeeNumber, Amount, DateOfTransaction, DateOfEntry)
values(2, 20,'2014-01-02', '2013-01-01')

select * from  tblTransaction2
where EmployeeNumber <3

drop table tblTransaction2

alter table tblTransaction
drop column DateOfEntry

-- usuwamy najpierw ograniczenie przed usuniêciem tablei
alter table tblTransaction
drop constraint defDateOfEntry


alter table tblTransaction
drop column DateOfEntry


select * from tblTransaction