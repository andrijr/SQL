
-- 128 bit�w =  select  power(2, 128)
-- GUID use 16 bit�w

declare @newValue as uniqueidentifier  -- GUID
set @newValue = NEWID()
select @newValue as TheNewID

begin tran
create table tblEmployee4
( UniqueID uniqueidentifier CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWID(), -- powoduj� problemy z wydajno�ci�
EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE )

insert into tblEmployee4 (EmployeeNumber)
values ( 1), (2), (3)
select * from tblEmployee4
rollback tran
go


-- to zwraca b��d tylko dzia�a w tabeli
declare @newValue as uniqueidentifier  -- GUID
set @newValue = NEWSEQUENTIALID()
select @newValue as TheNewID
go


begin tran
create table tblEmployee4
( UniqueID uniqueidentifier CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWSEQUENTIALID(), -- daje lepsz� wydajno�� od NEWID()
EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE )

insert into tblEmployee4 (EmployeeNumber)
values ( 1), (2), (3)
select * from tblEmployee4
rollback tran
go