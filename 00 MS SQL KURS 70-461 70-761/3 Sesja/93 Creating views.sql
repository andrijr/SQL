select 1  
go

Create View ViewByDepartment as
select d.Department, t.EmployeeNumber, t.DateOfTransaction, t.Amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
--order by d.Department, t.EmployeeNumber
go
-- w widoku nie s� dozwolone sortowania
-- dojemy koniecznie gq na ko�cu przy widoku poniewa� nast�pnie mamy now� instrukcje a instrukcje przy widokach musz� by� odizolowane
-- widoku musi by� jedn� instrukcj� w partii
-- go oznacza koniec partii



Create View ViewSummary as
select top(1000) d.Department, t.EmployeeNumber, sum(t.Amount) as Amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t
on e.EmployeeNumber = t.EmployeeNumber
where t.EmployeeNumber between 120 and 139
group by d.Department, t.EmployeeNumber
order by d.Department, t.EmployeeNumber
go
-- je�eli mamy top to sortowania s� dozwolone w widoku

select * from ViewSummary
