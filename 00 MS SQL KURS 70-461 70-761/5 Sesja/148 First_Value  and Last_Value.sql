
-- domy�lnie 	range between unbounded preceding and current row 

select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
first_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
	rows between unbounded preceding and current row )
	as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
	rows between unbounded preceding and current row )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
first_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
 )
	as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
 )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 



select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
first_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth) as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
	rows between unbounded preceding and unbounded following )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
first_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth 
	rows between 2 preceding and current row )
	as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
	rows between unbounded preceding and unbounded following )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
FIRST_VALUE(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth 
	rows between 2 preceding and current row )
	as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
	rows between unbounded preceding and 2 following )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


-- warto�� domy�lna od nieograniczonych poprzedzaj�cych do bierz�cych
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
first_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
first_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth 
	rows between 2 preceding and current row )
	as FirstMonth,
Last_value(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth
	rows between unbounded preceding and 2 following )
	as LastMonth
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


-- czyli w obu przypadkach range jest domy�lny kt�ry daj� gorz� wydajno��
-- range jest wolniejsze od rows