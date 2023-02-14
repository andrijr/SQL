select * from tblAttendance



select e.Department, e.EmployeeFirstName, e.EmployeeLastName, e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance 
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
