-- funkcje mog¹ byæ szybkie ale te¿ mog¹ byæ bardzo wolne w porównaniu z prostymy zwyk³ymi zapytaniami
-- dla prostych zapytañ funkjca nie jest wstanie zoptymalizowaæ wiêcej ni¿ to robi proste zapytanie i mo¿e byæ wolniejsza.

create or alter function fnc_TansactionTotal (@intEmployee as int)
returns money
as
begin
	declare @TotalAmount as money
	select @TotalAmount = sum(Amount) 
	from tblTransaction
	where EmployeeNumber = @intEmployee
	return @TotalAmount
end
go
 

select dbo.fnc_TansactionTotal(134)

select * 
from tblTransaction  
where EmployeeNumber = 13




select EmployeeNumber, dbo.fnc_TansactionTotal(EmployeeNumber) as TotalAmount
from tblEmployee

select e.EmployeeNumber, sum(Amount) as TotalAmount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
group by e.EmployeeNumber

select e.EmployeeNumber
, ( select sum(t.Amount) as TotalAmount from tblTransaction as t where e.EmployeeNumber = t.EmployeeNumber) as TotalAmount
from tblEmployee as e


-- takich po³¹czeñ unikaæ
select distinct e.EmployeeNumber, sum(t.Amount) over (partition by e.EmployeeNumber) as TotalAmount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
go


-- funkcja tabelaryczna
create or alter function fnc_TansactionALL (@intEmployee as int)
returns @returnstable table
(Amount smallmoney)
as
begin
	insert @returnstable
	select amount
	from dbo.tblTransaction
	where EmployeeNumber = @intEmployee
	return
end
go


select * from  dbo.fnc_TansactionALL(134)


-- funkcja tabelaryczna
select e.EmployeeNumber, sum(t.Amount) as TotalAmount
from tblEmployee as e
outer apply fnc_TansactionALL(e.EmployeeNumber) as t
group by e.EmployeeNumber

-- funkcja zwyk³a
select EmployeeNumber, dbo.fnc_TansactionTotal(EmployeeNumber) as TotalAmount
from tblEmployee


select e.EmployeeNumber, sum(Amount) as TotalAmount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber
group by e.EmployeeNumber

select e.EmployeeNumber
, ( select sum(t.Amount) as TotalAmount from tblTransaction as t where e.EmployeeNumber = t.EmployeeNumber) as TotalAmount
from tblEmployee as e