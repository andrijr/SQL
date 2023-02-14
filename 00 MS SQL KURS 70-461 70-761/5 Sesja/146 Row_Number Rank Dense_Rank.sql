select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
ROW_NUMBER() over(order by e.EmployeeNumber,  a.AttendanceMonth) as TheRowNumber
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
ROW_NUMBER() over(partition by e.EmployeeNumber order by e.EmployeeNumber,  a.AttendanceMonth) as TheRowNumber,
RANK() over(partition by e.EmployeeNumber order by e.EmployeeNumber,  a.AttendanceMonth) as TheRank,
DENSE_RANK() over(partition by e.EmployeeNumber order by e.EmployeeNumber,  a.AttendanceMonth) as TheDenseRank
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
ROW_NUMBER() over(partition by e.EmployeeNumber order by e.EmployeeNumber,  a.AttendanceMonth) as TheRowNumber,
RANK() over(partition by e.EmployeeNumber order by e.EmployeeNumber,  a.AttendanceMonth) as TheRank,
DENSE_RANK() over(partition by e.EmployeeNumber order by e.EmployeeNumber,  a.AttendanceMonth) as TheDenseRank
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber


select *, ROW_NUMBER() over() from tblAttendance

-- kiedy nie interesuje mnie kolejnoœæ tylko chcê ponumerowaæ to przyœpiesza dzia³¹nie
select *, ROW_NUMBER() over(order by (select null) ) from tblAttendance