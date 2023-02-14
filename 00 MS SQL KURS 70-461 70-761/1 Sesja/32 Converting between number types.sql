select 3/2
select 3.0/2
select 3/2.0
declare @myVar as decimal(10,4) = 3
select @myVar / 2
go

-- IMPLICIT Niejawny sposób konwertacji
declare @myVar as decimal(5,2) = 3
select @myVar


-- EXPLICIT Jawny sposób konwertacji
select CONVERT(decimal(5,2), @myVar)/2
select cast(@myVar as decimal(5,2))/2
-- aretymetyczny b³¹d przepe³nienia
select CONVERT(decimal(5,2), 1000)/2
