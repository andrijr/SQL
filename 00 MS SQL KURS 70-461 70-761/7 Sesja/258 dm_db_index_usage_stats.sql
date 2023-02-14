-- D M V S    
-- D M Dynamic Management 
-- D B Baza Danych

select * 
from sys.objects

select * from sys.dm_db_index_usage_stats
select * from sys.dm_db_missing_index_details
select * from sys.dm_db_missing_index_columns
select * from sys.dm_db_missing_index_groups
select * from sys.dm_db_index_physical_stats


select * 
from sys.dm_db_index_usage_stats

-- user_seek - kolumna iloœæ wyszukiwañ jest najskuteczniejsze - czym wiêksza liczba wiecej wyszukiwañ tym bardziej wydajny indeks
-- user_lookups - œrednia skurtecznoœæ
-- user_scan  - najmniej skuteczne

select db_name(database_id) as Database_Name , * 
from sys.dm_db_index_usage_stats

select db_id() -- 7


select db_name(database_id) as Database_Name ,
object_name(object_id) as Table_Name , * 
from sys.dm_db_index_usage_stats
where database_id = db_id()

select * from sys.tables

select * from  sys.dm_db_index_usage_stats
select * from sys.indexes


-- sprawdzamy czy indeks jest wydajny czy nie zatrzyma³ siê jak czêsto urzywany ¿eby usun¹æ zbêdne indeksy lub nie wydajne
select db_name(database_id) as Database_Name ,
object_name(dbi.object_id) as Table_Name ,
i.name as Index_Name, 
dbi.* 
from sys.dm_db_index_usage_stats as dbi
join sys.indexes as i
on i.object_id = dbi.object_id and i.index_id = dbi.index_id
where database_id = db_id()