select system_type_id, column_id, system_type_id / column_id as Calckulation
from sys.all_columns

select system_type_id, column_id, system_type_id * 1.00000/ column_id as Calckulation
from sys.all_columns

select system_type_id, column_id, floor(system_type_id / column_id) as Calckulation
from sys.all_columns

select system_type_id, column_id, ceiling(system_type_id / column_id) as Calckulation
from sys.all_columns

select system_type_id, column_id, round(system_type_id / column_id, 1) as Calckulation
from sys.all_columns

select system_type_id, column_id, try_convert(tinyint, system_type_id / column_id * 2) as Calckulation
from sys.all_columns