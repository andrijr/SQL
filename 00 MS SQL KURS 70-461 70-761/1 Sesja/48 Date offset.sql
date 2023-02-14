declare @date1 as DATETIMEOFFSET(2) = getdate()
select @date1
go
declare @date1 as DATETIMEOFFSET = getdate()
select @date1
go
declare @date1 as datetime2 = '2022-02-02 01:30:10.456'
select @date1
-- select TODATETIMEOFFSET (@date1 ,  '+5:00')

select DATETIME2FROMPARTS     (2015,  6, 2,3, 2, 1, 456,        3)
select DATETIMEOFFSETFROMPARTS(2015,  6, 2,3, 2, 1, 456, 5, 30, 3)

select SYSDATETIMEOFFSET()
select SYSUTCDATETIME()
select SWITCHOFFSET(@date1, '-5:00')