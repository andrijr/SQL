
declare @param varchar(1000) = '127'
declare @sql varchar(1000) = 
			'select * from dbo.tblTransaction as t where t.EmployeeNumber = ' + @param;
exec (@sql);
go


declare @param varchar(1000) = '127' + char(10) + 'select * from tblDepartment';
declare @sql varchar(1000) = 
			'select * from dbo.tblTransaction as t where t.EmployeeNumber = ' + @param;
exec (@sql);
go


-- jest to 
declare @param varchar(1000) = '127'  ;
execute sys.sp_executesql
@statement = 
			N'select * from dbo.tblTransaction as t where t.EmployeeNumber = @EmployeeNumber',
			@params = N'@EmployeeNumber varchar(1000)',
			@EmployeeNumber = @param
go



declare @param varchar(1000) = '127' + char(10) + 'select * from tblDepartment';
execute sys.sp_executesql
@statement = 
			N'select * from dbo.tblTransaction as t where t.EmployeeNumber = @EmployeeNumber',
			@params = N'@EmployeeNumber varchar(1000)',
			@EmployeeNumber = @param


-- zapytania dynamicznie wyko¿ystuj¹ execute
-- zapytania sparametryzowane jak powy¿ej nie u¿ywaj¹ exec

