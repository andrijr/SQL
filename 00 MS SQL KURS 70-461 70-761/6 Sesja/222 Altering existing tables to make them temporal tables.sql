-- zwraca b³¹d poniea¿ nie mo¿e byæ null
alter table dbo.tblEmployee
add
  ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START
, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END 
, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo  )


-- dodajemy constraint
alter table dbo.tblEmployee
add
  ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START	constraint def_ValidFrom Default sysutcdatetime() 
, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END		constraint def_ValidTo Default convert(datetime2(2), '9999-12-31 23:59:59.9999999') 
, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo  )

select * from tblEmployee

alter table dbo.tblEmployee
set (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory2 ) )




