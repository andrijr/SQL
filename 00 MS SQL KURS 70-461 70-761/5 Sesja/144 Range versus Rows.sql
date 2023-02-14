select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- daj� to w rzeczywisto�ci sum� narastaj�co tylko �e dok�adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between unbounded preceding and current row )	-- 
	as RowsTotal,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	range between unbounded preceding and current row)	-- 
	as RangeTotal
from tblEmployee as e
join tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
--order by e.EmployeeNumber, a.AttendanceMonth


-- range ��czy duplikat a row sumuj� linia po linii
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- daj� to w rzeczywisto�ci sum� narastaj�co tylko �e dok�adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between unbounded preceding and current row)	-- 
	as RowsTotal,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	range between unbounded preceding and current row)	-- 
	as RangeTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
order by e.EmployeeNumber, a.AttendanceMonth



-- range ��czy duplikat a row sumuj� linia po linii
-- RANGE is only supported with UNBOUNDED and CURRENT ROW window frame delimiters.
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- daj� to w rzeczywisto�ci sum� narastaj�co tylko �e dok�adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between 1 preceding and current row)	-- 
	as RowsTotal,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	range between 1 preceding and current row)	-- 
	as RangeTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
order by e.EmployeeNumber, a.AttendanceMonth


-- range ��czy duplikat a row sumuj� linia po linii
-- RANGE is only supported with UNBOUNDED and CURRENT ROW window frame delimiters.
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- daj� to w rzeczywisto�ci sum� narastaj�co tylko �e dok�adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between 1 preceding and current row)	-- 
	as RowsTotal,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	range between unbounded preceding and current row)	-- 
	as RangeTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
order by e.EmployeeNumber, a.AttendanceMonth

-- unbounded preciding and current row
-- current row and unbounded preciding
-- unbounded preciding and unbounded preciding -- RANGE and ROWS




-- range ��czy duplikat a row sumuj� linia po linii
-- RANGE is only supported with UNBOUNDED and CURRENT ROW window frame delimiters.
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
-- daj� to w rzeczywisto�ci sum� narastaj�co tylko �e dok�adnie jest sprecyzowana
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	rows between current row  and unbounded following)	-- 
	as RowsTotal,
sum(a.NumberAttendance) 
over(partition by e.EmployeeNumber, year(a.AttendanceMonth) 
	order by a.AttendanceMonth 
	range between current row  and unbounded following)	-- 
	as RangeTotal
from tblEmployee as e
join (select * from tblAttendance UNION ALL select * from tblAttendance ) as a
on e.EmployeeNumber = a.EmployeeNumber
where a.AttendanceMonth  < '20150101' 
order by e.EmployeeNumber, a.AttendanceMonth

-- range jest wolniejsze od rows
