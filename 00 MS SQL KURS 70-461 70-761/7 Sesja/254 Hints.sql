-- sql server dobrze dobiera metody trzeba by� ostro�nym w r�cznym ustalaniu jak ma procowa�

create proc procTransactionBig (@EmployeeNumber as int) 
with recompile -- procedura b�dzie za ka�dym razem rekompilowana
-- with forceseek - b�dzie zawsze szuka�
-- with forcescan - bedzie zawsze skanowa�
as 
select * 
from 
tblTransactionBig  as t
left join tblEmployee as e
on t.EmployeeNumber = @EmployeeNumber
where t.EmployeeNumber = @EmployeeNumber
go




select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left join tblEmployee as e with   (nolock)  -- readuncommitted - nolock odpowiednik readuncommitted ale nolock dzia�a lepiej
on d.Department = e.Department   
where d.Department = 'HR'


select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left join tblEmployee as e with   (repeatableread)  
on d.Department = e.Department   
where d.Department = 'HR'


select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left join tblEmployee as e with   (repeatableread, forceseek)  
on d.Department = e.Department   
where d.Department = 'HR'

-- 43%
select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left hash join tblEmployee as e -- hash teraz b�dziemy mi�� po��czenie hash w testach wydajno�ci
on d.Department = e.Department   
where d.Department = 'HR'

-- 39%
select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left merge join tblEmployee as e -- merge teraz b�dziemy mi�� po��czenie merge w testach wydajno�ci
on d.Department = e.Department   
where d.Department = 'HR'

-- 19%
select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left loop join tblEmployee as e -- merge teraz b�dziemy mi�� po��czenie merge w testach wydajno�ci
on d.Department = e.Department   
where d.Department = 'HR'