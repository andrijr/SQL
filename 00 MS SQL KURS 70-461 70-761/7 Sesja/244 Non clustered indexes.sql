-- nie mo¿na mieæ wiêcej jak jeden indeks klastrowany
-- je¿eli chcesz mieæ dodatkowe indeksy mo¿esz to zrobiæ przy pomocy indeksów nieklastrowanych


-- indeks klastrowany 
-- nie wymaga unikalnoœci danych klucza
create clustered index idx_tblEmployee on dbo.tblEmployee ( EmployeeNumber)

-- indeks nieklastrowany wymaga unikatowe dane lub klucz podstawowy
create nonclustered index idx_tblEmployee_DateOfBirth on dbo.tblEmployee ( EmployeeNumber)

select * 
from tblEmployee
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01' -- scan przeszukujê ca³¹ tabele mimo ¿e jest nieklastrowany indeks nie urzywa go

select DateOfBirth 
from tblEmployee 
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01' -- scan przeszukujê ca³¹ tabele mimo ¿e jest nieklastrowany indeks nie urzywa go


create nonclustered index idx_tblEmployee_DateOfBirth_Department on dbo.tblEmployee ( EmployeeNumber, Department)


select DateOfBirth , Department
from tblEmployee 
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01' -- scan 