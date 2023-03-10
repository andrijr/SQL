select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over()	as TotalAttendance,
-- z decimal będzie dokładniejsze ale nie jest bezpiecze
convert(decimal(18,7), a.NumberAttendance) / sum(a.NumberAttendance) over()	* 100.0000 as PercentageAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where year(a.AttendanceMonth) = 2014



select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over(partition by e.EmployeeNumber )	as TotalAttendance,
-- z decimal będzie dokładniejsze ale nie jest bezpiecze
convert(decimal(18,7), a.NumberAttendance) / sum(a.NumberAttendance) over(partition by e.EmployeeNumber)	* 100.0000 as PercentageAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' -- lepiej użyć tak jak w przykładzie zamiast year(a.AttendanceMonth) bo to jednak dodatkowa funkcja


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over(partition by e.EmployeeNumber order by a.AttendanceMonth )	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over(partition by e.EmployeeNumber order by a.AttendanceMonth DESC)	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
order by e.EmployeeNumber, a.AttendanceMonth


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth DESC)	-- pobierz sume dla partycji suma narastająca po order by
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
order by e.EmployeeNumber, a.AttendanceMonth



select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between 1 preceding and 1 following)	-- uwzgłedni jeden wiersz przed i jeden wiersz po
	as RunningTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth