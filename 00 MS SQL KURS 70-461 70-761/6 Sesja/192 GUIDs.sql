
-- 128 bitów =  select  power(2, 128)
-- GUID use 16 bitów

declare @newValue as uniqueidentifier  -- GUID
set @newValue = NEWID()
select @newValue as TheNewID

begin tran
create table tblEmployee4
( UniqueID uniqueidentifier CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWID(), -- powodujê problemy z wydajnoœci¹
EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE )

insert into tblEmployee4 (EmployeeNumber)
values ( 1), (2), (3)
select * from tblEmployee4
rollback tran
go


-- to zwraca b³¹d tylko dzia³a w tabeli
declare @newValue as uniqueidentifier  -- GUID
set @newValue = NEWSEQUENTIALID()
select @newValue as TheNewID
go


begin tran
create table tblEmployee4
( UniqueID uniqueidentifier CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWSEQUENTIALID(), -- daje lepsz¹ wydajnoœæ od NEWID()
EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE )

insert into tblEmployee4 (EmployeeNumber)
values ( 1), (2), (3)
select * from tblEmployee4
rollback tran
go