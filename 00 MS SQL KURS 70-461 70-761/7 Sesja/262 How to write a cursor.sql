
-- kiedy wykonujesz select dostajesz nie jeden wiersz a ca³y zestaw 100 lub 1000 wierszy
-- kursor zwraca jeden wiersz nastêpnie kolejny wirsz i tak dalej

-- CURSORS
-- 1 DECLARE cursor CURSOR FOR SELECT statement FROM table
-- 2 OPEN cursor
-- 3 FETCH cursor INTO
-- 4 CLOSE cursor

-- @@FETCH_STATUS


-- 1 dklarujemy kursor a nastepnie mówimy z czym ma pracowaæ kursor
-- 2 nastêpnie musimy otworzyæ kursor i przenosi nas do wierdz zerowego wiersza do wiersza 0
-- 3 nastêpnie musimy pobraæ kursor i robimy to wiele razy
-- 4 nastêpnie zamykamy kursor i koñczymy

-- @@FETCH_STATUS - mówi nam czy kursor pracujê czy siê skoñczy³ - 0 nadal pracujê -1 - 2 jakiœ b³¹d




-- 47%
select t.* 
from tblTransaction as t
join tblEmployee as e
on t.EmployeeNumber = e.EmployeeNumber
where t.EmployeeNumber between 120 and 299


-- 53%
-- 1 - utworzyliœmy kursor
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
	FETCH NEXT FROM csr INTO @EmployeeID -- idziemy do nastêpnego rzêdu
end
-- 4
CLOSE csr 
-- 5
deallocate csr -- oddzilam pamiêæ kursora - jest przydatne













--with 
--MyTable as
--(select * 
--from tblEmployee
--where EmployeeNumber = 125)
--select * from MyTable
