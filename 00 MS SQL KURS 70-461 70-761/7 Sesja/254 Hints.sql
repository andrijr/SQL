-- sql server dobrze dobiera metody trzeba byæ ostro¿nym w rêcznym ustalaniu jak ma procowaæ

create proc procTransactionBig (@EmployeeNumber as int) 
with recompile -- procedura bêdzie za ka¿dym razem rekompilowana
-- with forceseek - bêdzie zawsze szukaæ
-- with forcescan - bedzie zawsze skanowaæ
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
left join tblEmployee as e with   (nolock)  -- readuncommitted - nolock odpowiednik readuncommitted ale nolock dzia³a lepiej
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
left hash join tblEmployee as e -- hash teraz bêdziemy miêæ po³¹czenie hash w testach wydajnoœci
on d.Department = e.Department   
where d.Department = 'HR'

-- 39%
select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left merge join tblEmployee as e -- merge teraz bêdziemy miêæ po³¹czenie merge w testach wydajnoœci
on d.Department = e.Department   
where d.Department = 'HR'

-- 19%
select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left loop join tblEmployee as e -- merge teraz bêdziemy miêæ po³¹czenie merge w testach wydajnoœci
on d.Department = e.Department   
where d.Department = 'HR'