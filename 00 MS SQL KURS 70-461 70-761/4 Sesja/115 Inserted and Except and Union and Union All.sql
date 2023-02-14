-- ten procent % modó³ jest wolny
select *, ROW_NUMBER() over (order by (select null)) % 3 as ShouldDelete, ROW_NUMBER() over (order by (EmployeeNumber)) as RowNumber
into tblTransactionNew
from tblTransaction


select * from tblTransactionNew

-- modulo
select 1 % 3 as col1, 2 % 3 as col2, 3 % 3 as col3, 4 % 3 as col4, 5 % 3 as col5, 6 % 3 as col6


begin tran
delete tblTransactionNew
output deleted.*
from tblTransactionNew
where ShouldDelete = 1
--rollback tran
commit tran


begin tran
update tblTransactionNew
set DateOfTransaction = dateadd(day, 1, DateOfTransaction)
output inserted.*, deleted.*
from tblTransactionNew
where ShouldDelete = 2
--rollback tran
commit tran



begin tran
alter table tblTransactionNew
drop column ShouldDelete
select * from tblTransactionNew
commit tran
--rollback tran

begin tran
alter table tblTransactionNew
drop column  RowNumber
select * from tblTransactionNew
commit tran
--rollback tran





-- pokazanie wszystkich wierszy z jednej i drugiej tabeli
select * from tblTransaction -- 2497
union all -- 4161
select * from tblTransactionNew -- 1664

-- pokazanie wszystkich ró¿nych wierszy bez duplikatów
select * from tblTransaction -- 2497
union  -- 3328 (4161 - 3328 = 833)
select * from tblTransactionNew -- 1664


-- pokazanie wszystkich wierszy z pierwszej tabli bez wierszy które maj¹ odpowiednik w drugiej tabeli
select * from tblTransaction -- 2497
except  -- 3328 (4161 - 3328 = 833)
select * from tblTransactionNew -- 1664


-- pokazanie tylko wierszy zduplikowane które s¹ i w pierszej i w drugiej tabeli
select * from tblTransaction -- 2497
intersect  -- 3328 (4161 - 3328 = 833)
select * from tblTransactionNew -- 1664


-- aby posortowaæ unie dodajemy sortowanie do ostatniej tablicy ³¹cz¹cej
select * from tblTransaction -- 2497
intersect  -- 3328 (4161 - 3328 = 833)
select * from tblTransactionNew -- 1664
order by EmployeeNumber