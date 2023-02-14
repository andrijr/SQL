
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between 1 preceding and 1 following)	-- uwzg³edni jeden wiersz przed i jeden wiersz po
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between 1 preceding and 0 following)	-- uwzg³edni jeden wiersz przed i 0 wierszy po
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- dajê to w rzeczywistoœci sumê narastaj¹co tylko ¿e dok³adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between unbounded preceding and 0 following)	-- unbounded nieograniczona partycja
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- dajê to w rzeczywistoœci sumê narastaj¹co tylko ¿e dok³adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between 0 preceding and unbounded following)	-- unbounded nieograniczona partycja
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- dajê to w rzeczywistoœci sumê narastaj¹co tylko ¿e dok³adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between current row and unbounded following)	-- current row jest to samo co 0 preceding
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- dajê to w rzeczywistoœci sumê narastaj¹co tylko ¿e dok³adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between unbounded preceding and unbounded following)	-- 
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth