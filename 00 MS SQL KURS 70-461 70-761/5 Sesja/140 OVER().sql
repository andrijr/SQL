
select e.Department, e.EmployeeFirstName, e.EmployeeLastName, e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance 
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber



select e.EmployeeNumber, year(a.AttendanceMonth) as AttendanceYear, sum(a.NumberAttendance ) as TotalAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
group by e.EmployeeNumber, year(a.AttendanceMonth)
order by e.EmployeeNumber, year(a.AttendanceMonth)


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over()	as TotalAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber

select sum(NumberAttendance) 	from tblAttendance 

select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over()	as TotalAttendance,
-- wynik daje 0 bo int dzielimy przez int  i daje int liczbê ca³kowit¹
a.NumberAttendance / sum(a.NumberAttendance) over()	* 100 as PercentageAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over()	as TotalAttendance,
-- wynik daje wiêcej jak  0 bo monay dzielimy przez int  daje dok³adnijszy wynik ale nadal zaokr¹g³a w dó³
convert(money, a.NumberAttendance) / sum(a.NumberAttendance) over()	* 100 as PercentageAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber

select 14/35409
select 14/35409.05
select convert(money, 14) / 35409
-- money ucina bo dzielimy na int
select convert(money, 14) / 35409 * 100
select convert(decimal(9,7) , 14) / 35409 * 100


select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
sum(a.NumberAttendance) over()	as TotalAttendance,
-- z decimal bêdzie dok³adniejsze ale nie jest bezpiecze
convert(decimal(18,7), a.NumberAttendance) / sum(a.NumberAttendance) over()	* 100 as PercentageAttendance
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
