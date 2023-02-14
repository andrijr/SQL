-- jaka jest alternatywa do tego kursora
-- piszemy kursory wtedy kiedy absolutnie potrzebujemy

select t.* 
from tblTransaction as t
right join tblEmployee as e
on t.EmployeeNumber = e.EmployeeNumber
where e.EmployeeNumber between 120 and 299
and t.EmployeeNumber is not null
