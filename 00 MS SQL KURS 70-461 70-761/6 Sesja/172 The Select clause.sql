select *
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
--where e.EmployeeLastName  like 'y%'
group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber


select count(t.EmployeeNumber) as NumTransaction
from tblTransaction as t


select *, ( select count(t.EmployeeNumber) as NumTransaction from tblTransaction as t ) 
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


select *, ( select count(t.EmployeeNumber)  from tblTransaction as t )  as NumTransaction
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


select *, ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = 126)  as NumTransaction
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber





select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, t.EmployeeNumber
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


-- do nauczenia si� do automatyzmu 1 spos�b 18% wydajno�ci
select  e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber

-- dr�gi spos�b 38% wtdajno�ci
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber

-- trzeci spos�b 44% wydajno�ci
select distinct e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) over( partition by e.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
--group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber


-- zwraca b��d bo mo�e zwr�ci� jedn� warto�� mo�emy szuka� agregacji min max itd kt�ra zwraca jedn� warto��
select e.*, ( select t.DateOfTransaction  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


-- jest poprawnie
select e.*  , ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			, ( select sum(t.Amount)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as TotalAmount
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


-- zwraca b��d poniewa� mo�e by� tylko jedna warto�� podsumowanie w correlated subquery
select e.*  , ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			, ( select sum(t.Amount)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as TotalAmount2
			, ( select count(t.EmployeeNumber) , sum(t.Amount)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as TotalAmount2
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber


--  zmieniamy na not like

-- do nauczenia si� do automatyzmu 1 spos�b 24% wydajno�ci
select  e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName not like 'y%'
order by e.EmployeeNumber

-- dr�gi spos�b 25% wtdajno�ci
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName not like 'y%'
group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber

-- trzeci spos�b 50 % wydajno�ci
select distinct e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) over( partition by e.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  not like 'y%'
--group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber


