select EmployeeLastName
from tblEmployee


drop index idx_tblEmployee on dbo.tblEmployee


-- jest bardziej efektywny indeks
create nonclustered index idx_tblEmployeeNumber 
on tblEmployee ( EmployeeNumber) 
include (EmployeeFirstName, EmployeeMiddleName, EmployeeLastName) 

-- jest mniej efektywny indeks	
create nonclustered index idx_LastNameForHr 
on tblEmployee ( EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName) 



select EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
from tblEmployee
where EmployeeNumber between 140 and 150 -- scan



drop index idx_tblEmployeeNumber on dbo.tblEmployee

drop index idx_LastNameForHr on dbo.tblEmployee


-- calstrowany indeks jest najbardziej efektywny
-- clastrowany indeks fizycznie zmienia tabele
create	clustered index idx_tblEmployeeNumber 
on dbo.tblEmployee ( EmployeeNumber) 



select EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
from tblEmployee
where EmployeeNumber between 140 and 150  -- seek


create	nonclustered index idx_DateOfBirthWithIncludes
on dbo.tblEmployee ( DateOfBirth) 
include (EmployeeFirstName, EmployeeMiddleName, EmployeeLastName) 


select EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
from tblEmployee
where DateOfBirth between '2000-01-01' and '2009-01-01'  -- seek
