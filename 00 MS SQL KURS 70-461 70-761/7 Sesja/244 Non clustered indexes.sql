-- nie mo�na mie� wi�cej jak jeden indeks klastrowany
-- je�eli chcesz mie� dodatkowe indeksy mo�esz to zrobi� przy pomocy indeks�w nieklastrowanych


-- indeks klastrowany 
-- nie wymaga unikalno�ci danych klucza
create clustered index idx_tblEmployee on dbo.tblEmployee ( EmployeeNumber)

-- indeks nieklastrowany wymaga unikatowe dane lub klucz podstawowy
create nonclustered index idx_tblEmployee_DateOfBirth on dbo.tblEmployee ( EmployeeNumber)

select * 
from tblEmployee
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01' -- scan przeszukuj� ca�� tabele mimo �e jest nieklastrowany indeks nie urzywa go

select DateOfBirth 
from tblEmployee 
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01' -- scan przeszukuj� ca�� tabele mimo �e jest nieklastrowany indeks nie urzywa go


create nonclustered index idx_tblEmployee_DateOfBirth_Department on dbo.tblEmployee ( EmployeeNumber, Department)


select DateOfBirth , Department
from tblEmployee 
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01' -- scan 