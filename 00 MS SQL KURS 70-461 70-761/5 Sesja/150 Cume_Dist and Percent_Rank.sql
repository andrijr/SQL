select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
Cume_Dist() 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyCumeDist,
Percent_Rank() 
	over(partition by e.EmployeeNumber 
	order by  a.AttendanceMonth )
	as MyPercentRank
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
--where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
Cume_Dist() 
	over(partition by a.NumberAttendance 
	order by  a.AttendanceMonth )
	as MyCumeDist,
Percent_Rank() 
	over(partition by a.NumberAttendance 
	order by  a.AttendanceMonth )
	as MyPercentRank
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber




select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
Cume_Dist() 
	over(partition by a.NumberAttendance 
	order by  a.AttendanceMonth ) * 22
	as MyCumeDist,
Percent_Rank() 
	over(partition by a.NumberAttendance 
	order by  a.AttendanceMonth ) * 21
	as MyPercentRank
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber