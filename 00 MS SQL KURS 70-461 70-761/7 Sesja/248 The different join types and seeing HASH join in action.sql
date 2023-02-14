
-- Hash Match
-- Nested Loops -- One small table, one large table
-- Merge Join -- Larged tables, sorted on join -- potrzebne indeksy klastrowane, unikatowe indeksy klastrowane

select *
from tblEmployee as e
left join tblDepartment as d
on e.Department = d.Department -- Hash Match


select d.Department, d.Department, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblEmployee as e
left join tblDepartment as d
on e.Department = d.Department -- Hash Match