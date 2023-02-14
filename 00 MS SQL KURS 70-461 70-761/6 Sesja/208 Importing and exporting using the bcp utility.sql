-- BCP program do kopiowania zbiorczego


-- w cmd wpisujemy dla eksportu
-- bcp [70-461].dbo.tblDepartment out mydata.out -N -T
-- N oznacza unicode a T uwierzytelnienien windows

create table dbo.tblDepartment2
( Department varchar(20) null,
DepartmentHead varchar(20) null )


select * from tblDepartment2


-- w cmd wpisujemy dla importu
-- bcp [70-461].dbo.tblDepartment2 in mydata.out -N -T
-- N oznacza unicode a T uwierzytelnienien windows

select * from tblDepartment2