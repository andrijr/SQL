--datetime2(1)
--6 bytes for precision less than 3		datetime2(1)	datetime2(2)
--7 bytes for precision 3 or 4			datetime2(3)	datetime2(4)
--All other precision require 8 bytes	 datetime2(5)

--numeric(1)
--1 - 9	5
--10-19	9
--20-28	13
--29-38	17

--select 'A' + 2
--select 2 + 'A'

--select * from Inserted
--union
--select * from Deleted


-- nie dodajê nag³ówka bo w drugiej unii
select convert(char(5), 'hi')
union
select convert(char(11), 'hello there') as MyColumn


-- dodajê nag³ówek bo w pierwszej tabeli
select convert(tinyint, 45) as MyColumn
union
select convert(bigint, 456)


-- nie dodajê trzeciej unii bo jest taka sama
-- nie uwzg³êdnia nazwy kolumny w drugiej tabeli tylko w pierwszej
select convert(tinyint, 45) as MyColumn
union
select convert(bigint, 456) as MyColumn2
union
select convert(tinyint, 45) 


-- dodajê identyczn¹ uniê ostatni¹  bo jest union all
-- nie sortujê danych
select convert(tinyint, 45) as MyColumn
union
select convert(bigint, 456) as MyColumn2
union
select convert(tinyint, 46) 
union all
select convert(tinyint, 46) 


-- b³¹d poniewa¿ ró¿ne typy danych
select 'hi there'
union
select 4


select 4
union
select 'hi there'
go



-- do przeæwiczenia w innym miejscu
with cte as (
select convert(tinyint, 45) as MyColumn
union
select convert(bigint, 456)
)
select MyColumn
into tblTemp
from cte

