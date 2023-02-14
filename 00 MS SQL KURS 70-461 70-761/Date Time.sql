
select CURRENT_TIMESTAMP
select GETDATE()
select SYSDATETIME() 
select DATEADD(month, 1, getdate())
select datepart(day, getdate())
select DATENAME(WEEKDAY, getdate())
select DATEDIFF(day, getdate() , getdate()+1)
select SYSDATETIMEOFFSET()
--select TODATETIMEOFFSET(getdate(), '+1:00')
select DATETIME2FROMPARTS       (1975,05,15, 19, 00, 00, 124      ,5)
select DATETIMEOFFSETFROMPARTS(1975,05,15, 19, 00, 00, 124, 3, 00, 5)
select SYSUTCDATETIME()
select SWITCHOFFSET(getdate(), '-08:00')

SELECT PARSE('25 Mai 2018' AS date USING 'fr-FR')

select FORMAT(getdate(), 'dd-MM-yyyy')


 


