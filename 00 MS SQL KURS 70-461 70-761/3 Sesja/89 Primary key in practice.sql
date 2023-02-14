
-- UNIQUE			null-able
-- PRIMARY KEY		not null-able

alter table tblEmployee
add constraint PK_tblEmployee Primary KEY (EmployeeNumber)

insert into tblEmployee (EmployeeNumber,EmployeeFirstName , EmployeeMiddleName
           ,EmployeeLastName ,EmployeeGovernmentID ,DateOfBirth  ,Department)
values (2004, 'FirstName', 'MiddleName', 'LastName', 'AB1234567', '2014-01-01', 'Accounts')


insert into tblEmployee (EmployeeNumber,EmployeeFirstName , EmployeeMiddleName
           ,EmployeeLastName ,EmployeeGovernmentID ,DateOfBirth  ,Department)
values (2004, 'FirstName', 'MiddleName', 'LastName', 'AB123468', '2014-01-01', 'Accounts')

-- klucz podstawowy PRIMARY KEY jest domyœlne klastrowany 
-- klucz na podstawie UNIQUE nie jest klastrowany czyli wartoœci domyœlnie nie s¹ sortowane
-- mo¿na Primary key zrobiæ nieklastrowany dopisuj¹æ nonclustered

alter table tblEmployee
drop PK_tblEmployee

alter table tblEmployee
add constraint PK_tblEmployee Primary KEY  NONCLUSTERED (EmployeeNumber)

alter table tblEmployee
drop PK_tblEmployee

alter table tblEmployee
add constraint PK_tblEmployee Primary KEY   (EmployeeNumber)

create table tblEmployee2
(EmployeeNumber int Constraint PK_tblEmployee_EmployeeNumber Primary Key IDENTITY(1,1),
EmployeeName nvarchar(20))

insert into tblEmployee2
values ('My Name')

select * from tblEmployee2

delete from tblEmployee2

insert into tblEmployee2
values ('My Name')

select * from tblEmployee2

truncate table tblEmployee2

insert into tblEmployee2
values ('My Name')

select * from tblEmployee2

-- nie mo¿na wprowadzic bo jest klucz g³ówny clastrowany
insert into tblEmployee2 (EmployeeNumber, EmployeeName)
values ( 3, 'My Name') , (4, 'My name');

-- z takim zapisem mo¿na wprowadziæ mimo klucza g³ównego
SET IDENTITY_INSERT tblEmployee2 ON
insert into tblEmployee2 (EmployeeNumber, EmployeeName)
values ( 3, 'My Name') , (4, 'My name')
SET IDENTITY_INSERT tblEmployee2 OFF

select * from tblEmployee2

insert into tblEmployee2
values ('My Name')

select * from tblEmployee2


-- fukcje systemowe
-- odnosisiê do ostatniej u¿ytej tabeli 
select @@IDENTITY
select SCOPE_IDENTITY()

-- odnosi siê do konkretnej tabeli
select IDENT_CURRENT('dbo.tblEmployee2')








