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


-- do nauczenia siê do automatyzmu 1 sposób 18% wydajnoœci
select  e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName  like 'y%'
order by e.EmployeeNumber

-- drógi sposób 38% wtdajnoœci
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber

-- trzeci sposób 44% wydajnoœci
select distinct e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) over( partition by e.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  like 'y%'
--group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber


-- zwraca b³¹d bo mo¿e zwróciæ jedn¹ wartoœæ mo¿emy szukaæ agregacji min max itd która zwraca jedn¹ wartoœæ
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


-- zwraca b³¹d poniewa¿ mo¿e byæ tylko jedna wartoœæ podsumowanie w correlated subquery
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

-- do nauczenia siê do automatyzmu 1 sposób 24% wydajnoœci
select  e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, ( select count(t.EmployeeNumber)  from tblTransaction as t
			where t.EmployeeNumber = e.EmployeeNumber)  as NumTransaction
			-- correlated subquery
from tblEmployee as e
where e.EmployeeLastName not like 'y%'
order by e.EmployeeNumber

-- drógi sposób 25% wtdajnoœci
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName not like 'y%'
group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber

-- trzeci sposób 50 % wydajnoœci
select distinct e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
, count(t.EmployeeNumber) over( partition by e.EmployeeNumber) as NumTransaction
from tblTransaction as t
join tblEmployee as e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeLastName  not like 'y%'
--group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName 
order by e.EmployeeNumber


