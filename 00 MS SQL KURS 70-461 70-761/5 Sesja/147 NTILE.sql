
-- nie dzia³a to dla mnie poprawnie bo nie proporcjonalnie dzieli
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
NTILE(10) over(partition by e.EmployeeNumber 
				order by  a.AttendanceMonth) as TheNTile,
convert(int, (Row_number() over(partition by e.EmployeeNumber order by a.AttendanceMonth) - 1) /
	(count(*) over(partition by e.EmployeeNumber 
					order by a.AttendanceMonth
					rows between unbounded preceding and unbounded following ) / 10.0 ) ) + 1 as MyNTile
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 