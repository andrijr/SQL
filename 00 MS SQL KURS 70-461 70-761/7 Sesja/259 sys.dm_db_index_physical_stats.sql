

select * 
from sys.dm_db_index_physical_stats(db_id('70-461S7'), object_id('dbo.tblEmployee'), NULL, NULL, 'DETAILED')

-- index_lvevel - kolumna poziom indeksu


select * 
from sys.dm_db_index_physical_stats( null, null, null, null, 'DETAILED')