USE [70-461]
drop table  tblEmployee ;

create table tblEmployee
(EmployeeNumber INT not null
, EmployeeFirstName	Varchar(60) not null
, EmployeeMiddleName varchar(60) null
, EmployeeLastName	varchar(60) not null
, EmployeeGovernmentID	char(10) null
, DateOfBirth date not null
)

alter table tblEmployee
add  Department varchar(10) null

alter table tblEmployee
drop column Department

alter table tblEmployee
add  Department varchar(15) null

alter table tblEmployee
alter column Department varchar(20) null

select * from tblEmployee

insert into tblEmployee
Values 
(123,	'Jane',	'A',	'Zwilling',	'AB123456G',	'19850101',	'Customer Relations')

insert into tblEmployee (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID, DateOfBirth, Department)
Values 
(124,	'Jane',	'A',	'Zwilling',	'AB123456G',	'19850101',	'Customer Relations')

insert into tblEmployee (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID, DateOfBirth, Department)
Values 
(125,	'Jane',	'A',	'Zwilling',	'AB123456G',	'19850101',	'Customer Relations'),
(126,	'Jane',	'A',	'Zwilling',	'AB123456G',	'19850101',	'Customer Relations');

select * from tblEmployee


delete tblEmployee where EmployeeNumber = 123

truncate table tblEmployee

insert into tblEmployee (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID, DateOfBirth, Department)
Values 
(125,	'Jane',	'A',	'Zwilling',	'AB123456G',	'19850101',	'Customer Relations'),
(126,	'Jane',	'A',	'Zwilling',	'AB123456G',	'19850101',	'Customer Relations');

select * from tblEmployee
where  EmployeeLastName = 'Word'

select * from tblEmployee
where  EmployeeLastName <> 'Word'

select * from tblEmployee
where  EmployeeLastName != 'Word'


select * from tblEmployee
where  EmployeeLastName >= 'Word'

select * from tblEmployee
where  EmployeeLastName like 'W%'

select * from tblEmployee
where  EmployeeLastName like '_W%'

-- % = 0 - infinity characters
-- _ = 1 characters
-- [A-G] = In the range A-G
-- [AGQ] = A, G or Q
-- [^AGQ] = not A, G or Q

select * from tblEmployee
where  EmployeeLastName like '[%]%'