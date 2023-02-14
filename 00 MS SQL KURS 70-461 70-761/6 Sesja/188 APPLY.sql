
select * 
from dbo.TransList(123)
go

select * 
from dbo.TransactionList(123)
go

select e.*,
( select count(*) from dbo.TransList(e.EmployeeNumber) ) as NumTransaction
from tblEmployee as e

select e.*,
( select count(*) from tblTransaction as t where t.EmployeeNumber = e.EmployeeNumber ) as NumTransaction
from tblEmployee as e


select e.*
from tblEmployee as e
where exists ( select count(*) from tblTransaction as t where t.EmployeeNumber = e.EmployeeNumber ) 


select e.*
from tblEmployee as e
where exists ( select count(*) from dbo.TransList(e.EmployeeNumber) ) 




select *
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber

-- zwraca b³¹d przy ³¹czeniu tabli funkcji
select *
from tblEmployee as e
left join dbo.TransList(e.EmployeeNumber) as t
on e.EmployeeNumber = t.EmployeeNumber

-- 123 left join dbo.TransList(123)
-- 124 left join dbo.TransList(123)



select *
from tblEmployee as e
outer apply dbo.TransList(e.EmployeeNumber) as t -- left join


select *
from tblEmployee as e
cross apply dbo.TransList(e.EmployeeNumber) as t -- inner join


-- outer apply =  left join      all of tblEmployee, UDF 0+ rows
-- cross apply =  Inner Join     UDF 1+ rows
