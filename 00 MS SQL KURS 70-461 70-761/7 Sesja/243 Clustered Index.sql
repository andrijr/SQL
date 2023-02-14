-- seek = few number of rows based on the index -- szukanie konkretnej wartoœci
-- scan = going throught the entire table  -- skanowanie musi wszystko zeskanowaæ

-- nie mo¿na mieæ wiêcej jak jeden indeks klastrowany

-- indeks klastrowany 
-- nie wymaga unikalnoœci danych klucza
create clustered index idx_tblEmployee on dbo.tblEmployee ( EmployeeNumber)

-- do tej tablicy mamy indeks 
select * from tblEmployee -- scan 74%
select * from tblEmployee where EmployeeNumber = 127 -- seek 26%

-- dla tej tablicy nie mamy indeksu
select * from tblTransaction -- scan 50%
select * from tblTransaction where EmployeeNumber = 127 -- scan 50%



drop index idx_tblEmployee on dbo.tblEmployee


select count(EmployeeNumber), EmployeeNumber
from tblEmployee
group by EmployeeNumber
having count(EmployeeNumber) > 1

select * 
into tblEmployee2
from tblEmployee
where EmployeeNumber <> 131

-- zwraca b³¹d bo nie jest unikalny ID
alter table tblEmployee
add constraint pk_tblEmployee Primary Key (EmployeeNumber)

alter table tblEmployee2
add constraint pk_tblEmployee Primary Key (EmployeeNumber)



create table MyTable
( ID int  Constraint pk_ID_MyTable Primary Key Identity(1,1) )

alter table MyTable
drop constraint pk_ID_MyTable
drop table MyTable




select * from tblEmployee2 -- scan 74%
select * from tblEmployee2 where EmployeeNumber = 127 -- seek 26%