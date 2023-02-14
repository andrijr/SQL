


select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by rollup (e.Department, e.EmployeeNumber, AttendanceMonth)
order by e.Department, e.EmployeeNumber, AttendanceMonth


-- GROUPING  dodaj� now� kolumn� okre�laj�ca czy to by� null czy nie
select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.EmployeeNumber) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by rollup (e.Department, e.EmployeeNumber, AttendanceMonth)
order by e.Department, e.EmployeeNumber, AttendanceMonth


-- GROUPING  dodaj� now� kolumn� okre�laj�ca czy to by� null czy nie
select e.Department, e.EmployeeNumber, AttendanceMonth , 
sum(a.NumberAttendance) as TotalAttendance,
GROUPING( e.EmployeeNumber) as EmployeeNumberGroupeBy,
GROUPING_ID( e.Department, e.EmployeeNumber, AttendanceMonth) as EmployeeNumberGroupeID
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by rollup (e.Department, e.EmployeeNumber, AttendanceMonth)
order by e.Department, e.EmployeeNumber, AttendanceMonth


