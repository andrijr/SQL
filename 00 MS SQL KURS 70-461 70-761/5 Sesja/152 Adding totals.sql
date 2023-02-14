select e.Department, e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance 
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber

-- zsumowanie ca³oœci
select sum( a.NumberAttendance ) as GrandTotal
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber


-- zsumowanie poprzez group by
select e.Department, e.EmployeeNumber, 
sum(a.NumberAttendance) as TotalAttendance
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by e.Department, e.EmployeeNumber

-- zsumowanie poprzez over
select e.Department, e.EmployeeNumber, 
sum(a.NumberAttendance) over (partition by e.Department, e.EmployeeNumber) as TotalAttendance
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber



select e.Department, e.EmployeeNumber, a.AttendanceMonth,
a.NumberAttendance , 0 as IsNullValue
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
UNION ALL
select e.Department, e.EmployeeNumber, null as AttendanceMonth, 
sum(a.NumberAttendance) as TotalAttendance, 2  as IsNullValue
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by e.Department, e.EmployeeNumber
UNION ALL
select e.Department, null, null as AttendanceMonth, 
sum(a.NumberAttendance) as TotalAttendance, 1 as IsNullValue
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by e.Department
UNION ALL
select null, null, null as AttendanceMonth, 
sum(a.NumberAttendance) as TotalAttendance, 0 as IsNullValue
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
order by e.Department, AttendanceMonth 