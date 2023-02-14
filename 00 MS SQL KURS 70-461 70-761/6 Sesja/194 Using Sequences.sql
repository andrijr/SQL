-- alternatywa dla    NEWSEQUENTIALID()
-- sekwencje

Begin tran
Create SEQUENCE newSeq as bigint -- int
Start WITH 1
INCREMENT By 1
MINVALUE 1
--MAXVALUE 999999
--CYCLE
CACHE 50
select NEXT value FOR newSeq as NextValue;
rollback tran



if exists( select * from sys.objects where name = 'newSeq' )
drop  SEQUENCE dbo.newSeq

if object_Id(N'dbo.newSeq', N'SO') is not null
drop SEQUENCE dbo.newSeq


Create  SEQUENCE newSeq as bigint 
Start WITH 1
INCREMENT By 1
MINVALUE 1
--MAXVALUE 999999
--CYCLE
CACHE 50

if exists( select * from sys.objects where name = 'DF_Transaction' )
alter table tblTransaction
drop CONSTRAINT DF_Transaction

if exists( select NextNumber from tblTransaction  )
alter table tblTransaction
drop column NextNumber


alter table tblTransaction
add NextNumber int CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq




alter table tblTransaction
drop CONSTRAINT DF_Transaction
alter table tblTransaction
drop column NextNumber

alter table tblTransaction
add NextNumber int
alter table tblTransaction
add CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq FOR NextNumber



begin tran
select * from tblTransaction
Insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber )
Values (1, '2017-01-01', 123)
select * from tblTransaction where EmployeeNumber = 123
rollback tran


begin tran
select * from tblTransaction
Insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber )
Values (1, '2017-01-01', 123)
select * from tblTransaction where EmployeeNumber = 123

update tblTransaction
set NextNumber = NEXT VALUE for newSeq
where NextNumber is null
select * from tblTransaction where EmployeeNumber = 123
rollback tran



-- set identity_insert tablename on
-- DBCC CHECKIDENT (tablename, RESEED )

alter SEQUENCE newSeq
restart -- restart od pocz¹tku

alter SEQUENCE newSeq
restart with 1


alter table tblTransaction
drop CONSTRAINT DF_Transaction
alter table tblTransaction
drop column NextNumber
drop SEQUENCE newSeq