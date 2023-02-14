
-- kiedy wykonujesz select dostajesz nie jeden wiersz a ca�y zestaw 100 lub 1000 wierszy
-- kursor zwraca jeden wiersz nast�pnie kolejny wirsz i tak dalej

-- CURSORS
-- 1 DECLARE cursor CURSOR FOR SELECT statement FROM table
-- 2 OPEN cursor
-- 3 FETCH cursor INTO
-- 4 CLOSE cursor

-- @@FETCH_STATUS


-- 1 dklarujemy kursor a nastepnie m�wimy z czym ma pracowa� kursor
-- 2 nast�pnie musimy otworzy� kursor i przenosi nas do wierdz zerowego wiersza do wiersza 0
-- 3 nast�pnie musimy pobra� kursor i robimy to wiele razy
-- 4 nast�pnie zamykamy kursor i ko�czymy

-- @@FETCH_STATUS - m�wi nam czy kursor pracuj� czy si� sko�czy� - 0 nadal pracuj� -1 - 2 jaki� b��d




-- 47%
select t.* 
from tblTransaction as t
join tblEmployee as e
on t.EmployeeNumber = e.EmployeeNumber
where t.EmployeeNumber between 120 and 299


-- 53%
-- 1 - utworzyli�my kursor
DECLARE @EmployeeID int
DECLARE csr CURSOR FOR 
select EmployeeNumber 
from tblEmployee
where EmployeeNumber between 120 and 299
-- 2
OPEN csr
-- 3
FETCH NEXT FROM csr INTO @EmployeeID
while @@FETCH_STATUS = 0 
begin
	select * from tblTransaction where EmployeeNumber = @EmployeeID -- pobieramy wszystkie transakcji dla kontrektnego numeru
	FETCH NEXT FROM csr INTO @EmployeeID -- idziemy do nast�pnego rz�du
end
-- 4
CLOSE csr 
-- 5
deallocate csr -- oddzilam pami�� kursora - jest przydatne













--with 
--MyTable as
--(select * 
--from tblEmployee
--where EmployeeNumber = 125)
--select * from MyTable
