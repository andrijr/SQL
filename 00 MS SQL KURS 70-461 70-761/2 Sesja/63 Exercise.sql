

select DATEPART(month, DateOfBirth) as MonthNumber, count(*) as NumberEmployee
from tblEmployee
group by DATEPART(month, DateOfBirth) 

select DATENAME(month, DateOfBirth) as MonthNumber, count(*) as NumberEmployee
from tblEmployee
group by DATENAME(month, DateOfBirth) 


select DATENAME(month, DateOfBirth) as MonthNumber, count(*) as NumberEmployee
from tblEmployee
group by DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth) 
order by DATEPART(month, DateOfBirth) 


select DATENAME(month, DateOfBirth) as MonthNumber, count(*) as NumberEmployee, count(EmployeeMiddleName)
from tblEmployee
group by DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth) 
order by DATEPART(month, DateOfBirth) 

select DATENAME(month, DateOfBirth) as MonthNumber, count(*) as NumberEmployee, count(EmployeeMiddleName)
, min(DateOfBirth) as minDate
, format(min(DateOfBirth) , 'D') as minDateName
from tblEmployee
group by DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth) 
order by DATEPART(month, DateOfBirth) 

