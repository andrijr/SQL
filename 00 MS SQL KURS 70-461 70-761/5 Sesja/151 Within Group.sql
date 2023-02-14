select distinct EmployeeNumber,
PERCENTILE_CONT(0.5) WITHIN GROUP (order by NumberAttendance) over (partition by EmployeeNumber) as AverageCount,
PERCENTILE_DISC(0.5) WITHIN GROUP (order by NumberAttendance) over (partition by EmployeeNumber) as AverageDisc
from tblAttendance