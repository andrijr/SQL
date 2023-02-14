select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance ,
Cume_Dist() 
	over(partition by a.NumberAttendance 
	order by  a.AttendanceMonth )  * 100
	as MyCumeDist,
Percent_Rank() 
	over(partition by a.NumberAttendance 
	order by  a.AttendanceMonth ) * 100
	as MyPercentRank
from tblEmployee as e
join  tblAttendance as a
on e.EmployeeNumber = a.EmployeeNumber



-- 1 3 6 7 7 
-- Mean = (1+3+6+7+7)/5 = 4.8 -- AVG()
-- Mode = 7
-- Median = Pecentyle 50% =  6


-- 1 3 4 6 7 7 
-- Mean = (1+3+4+6+7+7)/6 = 4.66 -- AVG()
-- Mode = 7
-- Median = Pecentyle 50% = 5



select distinct EmployeeNumber,
PERCENTILE_CONT(0.5) WITHIN GROUP (order by NumberAttendance) over (partition by EmployeeNumber) as AverageCount,
PERCENTILE_DISC(0.5) WITHIN GROUP (order by NumberAttendance) over (partition by EmployeeNumber) as AverageDisc
from tblAttendance