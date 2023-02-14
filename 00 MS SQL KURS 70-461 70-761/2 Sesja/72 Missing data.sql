select count(e.EmployeeFirstName) 
from tblEmployee  e

-- wszyscy pracownicy kt�rzy nie maj� operacji
select e.EmployeeNumber,  e.EmployeeFirstName, e.EmployeeLastName,
t.EmployeeNumber, sum(t.Amount) as SumOfAmount
from tblEmployee  e
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber is null -- = null
group by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
order by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName

-- wszyscy pracownicy kt�rzy nie maj� operacji
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName,
t.EmployeeNumber, sum(t.Amount) as SumOfAmount
from tblTransaction t 
right join tblEmployee  e
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber is null -- = null
group by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
order by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName

-- wszystkie operacje kt�re nie maj� pracownik�w
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName,
t.EmployeeNumber
from tblEmployee  e
right join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber is null -- = null
group by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
order by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName


-- wszystkie operacje kt�re nie maj� pracownik�w
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName,
t.EmployeeNumber
from tblTransaction t
left join  tblEmployee  e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber is null -- = null
group by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
order by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName

-------------------

begin transaction  -- begin tran

select count(*) from tblTransaction

delete tblTransaction
-- select *
from tblTransaction t
left join  tblEmployee  e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber is null 

select count(*) from tblTransaction

rollback tran -- rolback transaction

---------------------

begin tran

delete tblTransaction
from tblTransaction 
where EmployeeNumber IN (
select t.EmployeeNumber from (
select  e.EmployeeFirstName, e.EmployeeLastName,
t.EmployeeNumber
from tblTransaction t
left join  tblEmployee  e
on e.EmployeeNumber = t.EmployeeNumber
where e.EmployeeNumber is null -- = null
group by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
--order by e.EmployeeNumber, t.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
) t
)

rollback tran

