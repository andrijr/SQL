
select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by rollup (e.Department, e.EmployeeNumber, AttendanceMonth)
order by e.Department, e.EmployeeNumber, AttendanceMonth



-- cube daje 7 sum
select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by cube (e.Department, e.EmployeeNumber, AttendanceMonth)
order by e.Department, e.EmployeeNumber, AttendanceMonth



select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by Grouping sets ( ( e.Department, e.EmployeeNumber, AttendanceMonth), ( e.Department) )
order by e.Department, e.EmployeeNumber, AttendanceMonth



select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by Grouping sets ( ( e.Department, e.EmployeeNumber, AttendanceMonth), ( e.Department), () )
order by e.Department, e.EmployeeNumber, AttendanceMonth


select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by Grouping sets ( ( e.Department, e.EmployeeNumber, AttendanceMonth), ( e.Department), () )
order by coalesce(e.Department, 'zzzzzzz'), coalesce(e.EmployeeNumber, 99999), coalesce(a.AttendanceMonth, '2100-01-01')


select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by Grouping sets ( ( e.Department, e.EmployeeNumber, AttendanceMonth), ( e.Department), () )
order by case when e.Department is null then 1 else 0 end , Department,
		case when e.EmployeeNumber is null then 1 else 0 end , EmployeeNumber,
		case when a.AttendanceMonth is null then 1 else 0 end , AttendanceMonth
