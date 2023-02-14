
select t1.*
into dbo.tblTransactionBigger
from tblTransaction as t1
cross join tblTransaction as t2

select * 
from tblTransactionBigger
where EmployeeNumber = 127


-- szukamy indeksów których brakujê i warto za³o¿yæ

select * from sys.dm_db_missing_index_details
where database_id = db_id()

select mig.*, statement as table_name, column_id, column_name, column_usage
from sys.dm_db_missing_index_details as mid
cross apply sys.dm_db_missing_index_columns(mid.index_handle) 
inner join sys.dm_db_missing_index_groups as mig
on mig.index_group_handle = mid.index_handle
where database_id = db_id()
