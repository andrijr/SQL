select d.Department, d.Department, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblEmployee as e
left join tblDepartment as d
on e.Department = d.Department -- Hash Match


select d.Department, d.Department, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblEmployee as e
left join tblDepartment as d
on e.Department = d.Department 
where d.Department = 'HR' -- Nested Loops



select *
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  -- Hash Match


select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  -- Hash Match -- ¿adna z tych table nie jet ma³a


select count(*), EmployeeNumber
from tblEmployee
group by EmployeeNumber
having count(*) > 1

select * from tblEmployee where EmployeeNumber = 131

begin tran
delete tblEmployee
output deleted.*
from tblEmployee 
where EmployeeNumber = 131 and DateOfBirth = '1971-12-24'
--rollback tran
commit tran

select * from tblEmployee where EmployeeNumber = 131

-- tworzymy unikalny clastrowany indeks
create unique clustered index idx_tblEmployee on dbo.tblEmployee (EmployeeNumber)

create unique clustered index idx_tblTransaction on dbo.tblTransaction (EmployeeNumber, DateOfTransaction, Amount)

select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  -- Merge Join -- ¿adna z tych table nie jet ma³a


select *
into tblEmployeeNoIndex
from tblEmployee as e

select *
into tblTransactionNoIndex
from tblTransaction as e


select e.EmployeeNumber, t.Amount
from tblEmployee as e
left join tblTransaction as t
on e.EmployeeNumber = t.EmployeeNumber  -- Merge Join -- ¿adna z tych table nie jet ma³a

select e.EmployeeNumber, t.Amount
from tblEmployeeNoIndex as e
left join tblTransactionNoIndex as t
on e.EmployeeNumber = t.EmployeeNumber  -- Hash Match -- ¿adna z tych table nie jet ma³a