select * from tblEmployee
where DateOfBirth between '19760101' and '19861231'

select * from tblEmployee
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

select * from tblEmployee
where year(DateOfBirth) between '1976' and '1986' -- DO NOT USE -- bêdzie wolniejsze


select year(DateOfBirth) as YearOfDateOfBirth , count(*) as NumberRows 
from tblEmployee
where 1=1
group by year(DateOfBirth)
order by year(DateOfBirth) DESC --ASC


-- kolejnoœc w której robi sql serwer
--from tblEmployee
--where 1=1
--group by year(DateOfBirth)
--select year(DateOfBirth) as YearOfDateOfBirth , count(*) as NumberRows 
-- order by

