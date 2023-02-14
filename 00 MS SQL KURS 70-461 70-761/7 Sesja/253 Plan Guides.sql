select * 
into dbo.tblTransactionBig
from tblTransaction


insert into dbo.tblTransactionBig (Amount, DateOfTransaction, EmployeeNumber) 
select t1.Amount, t2.DateOfTransaction, 1 as EmployeeNumber
from tblTransaction as t1
cross join ( select * from tblTransaction where EmployeeNumber < 200)  as t2


create nonclustered index idx_tblTransactionBig on dbo.tblTransactionBig (EmployeeNumber)
go

create proc procTransactionBig (@EmployeeNumber as int)
as 
select * 
from 
tblTransactionBig  as t
left join tblEmployee as e
on t.EmployeeNumber = @EmployeeNumber
where t.EmployeeNumber = @EmployeeNumber

exec procTransactionBig 1

exec procTransactionBig 132

drop proc procTransactionBig
go


-- procedura bêdzie za ka¿dym razem rekompilowana
-- to dodaje trochy czasu ale zalet¹ jest je¿eli masz bardzo ró¿ne wyniki to mo¿e byæ bardziej wydajne.
create proc procTransactionBig (@EmployeeNumber as int) with recompile -- procedura bêdzie za ka¿dym razem rekompilowana
as 
select * 
from 
tblTransactionBig  as t
left join tblEmployee as e
on t.EmployeeNumber = @EmployeeNumber
where t.EmployeeNumber = @EmployeeNumber


exec procTransactionBig 1

exec procTransactionBig 132



