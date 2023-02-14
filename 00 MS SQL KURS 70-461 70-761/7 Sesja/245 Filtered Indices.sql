select EmployeeLastName
from tblEmployee
where Department = 'HR' -- scan

-- filtrowany indeks
create nonclustered index idx_LastNameForHr on tblEmployee ( EmployeeLastName) where Department = 'HR' 


select EmployeeLastName
from tblEmployee
where Department = 'HR' -- scan