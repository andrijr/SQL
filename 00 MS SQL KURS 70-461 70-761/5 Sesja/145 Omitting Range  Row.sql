select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over() 	as RowsTotal
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 

select sum(a.NumberAttendance) from tblAttendance a



-- range between unbounded preceding and unbounded following -- DEFAULT where there is no ORDER BY
-- range between unbounded preceding and current row -- DEFAULT where there is ORDER BY

-- czyli w obu przypadkach range jest domyœlny który dajê gorz¹ wydajnoœæ
-- range jest wolniejsze od rows
-- rows between unbounded preceding and unbounded following
-- range ³¹czy duplikat a row sumujê linia po linii
-- RANGE is only supported with UNBOUNDED and CURRENT ROW window frame delimiters.

-- czyli rekomendacja ¿awsze u¿ywaæ zakresów od do rows range a nie u¿ywaæ domyœlnych ustawieñ





-- range between unbounded preceding and unbounded following -- DEFAULT where there is no ORDER BY
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth) -- order by  a.AttendanceMonth  
	 ) 	
	as RowsTotal
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber


-- range between unbounded preceding and unbounded following -- DEFAULT where there is no ORDER BY
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	rows between unbounded preceding and unbounded following) 	
	as RowsTotal
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber



-- rows / range between unbounded preceding and current row -- DEFAULT where there is ORDER BY
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	 ) 	
	as RowsTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber


-- rows / range between unbounded preceding and current row -- DEFAULT where there is ORDER BY
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	rows  between unbounded preceding and current row) 	
	as RowsTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
count(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	rows  between unbounded preceding and current row) 	
	as RowsTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
avg(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	rows  between unbounded preceding and current row) 	
	as RowsTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
min(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	rows  between unbounded preceding and current row) 	
	as RowsTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
max(a.NumberAttendance) 
	over(partition by  e.EmployeeNumber, year(a.AttendanceMonth)  order by  a.AttendanceMonth  
	rows  between unbounded preceding and current row) 	
	as RowsTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber