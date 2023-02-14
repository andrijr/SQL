-- domyœlnie przesuniêcie o jeden wiersz
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
LAG(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLag,
LEAD(a.NumberAttendance) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLead
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


-- okreœlamy przesuniêcie o 3 wierszy
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
LAG(a.NumberAttendance, 3) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLag,
LEAD(a.NumberAttendance, 3) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLead
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


-- okreœlamy trzeci 3 parametr
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
LAG(a.NumberAttendance, 3, 999) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLag,
LEAD(a.NumberAttendance, 3,  e.EmployeeNumber) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLead
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
LAG(a.NumberAttendance, 1) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLag,
LEAD(a.NumberAttendance, 1) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyLead,
NumberAttendance - LAG(a.NumberAttendance, 1) 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyDiff
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 