-- char ASCII - 1 byte
-- varchar ASCII - 1 byte
-- nchar UNICODE - 2 byte
-- nvarchar UNICODE - 2 byte

declare @myVar as char(10)
set @myVar = 'hello'
select @myVar, len(@myVar), DATALENGTH(@myVar)
go
declare @myVar as varchar(10)
set @myVar = 'hello'
select @myVar, len(@myVar), DATALENGTH(@myVar)
go
declare @myVar as nchar(10)
set @myVar = 'hello'
select @myVar, len(@myVar), DATALENGTH(@myVar)
go
declare @myVar as nvarchar(10)
-- umieszczamy przy tekście N jeżeli jest to UNICODE
set @myVar = N'helloÙÙ'
select @myVar, len(@myVar), DATALENGTH(@myVar)
