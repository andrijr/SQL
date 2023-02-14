

SET STATISTICS IO ON
GO


select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left loop join tblEmployee as e -- merge teraz bêdziemy miêæ po³¹czenie merge w testach wydajnoœci
on d.Department = e.Department   
where d.Department = 'HR'


-- text
-- ntext
-- image
-- varchar(max)
-- nvarchar(max)
-- varbinary(max)


SET STATISTICS IO OFF
GO
