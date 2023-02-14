use [70-461]

drop  table tblTransaction ;

create table tblTransaction (
EmployeeNumber  int not null 
, Amount money not null
, DateOfTransaction datetime null
)