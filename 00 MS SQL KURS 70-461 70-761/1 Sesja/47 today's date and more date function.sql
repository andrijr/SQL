select CURRENT_TIMESTAMP
select getdate()
select SYSDATETIME()
select SYSDATETIMEOFFSET()

-- DATEADD (datepart , number , date )
-- Ta funkcja dodaje liczbê (liczbê ca³kowit¹ ze znakiem) do elementu daty wejœciowej daty i zwraca zmodyfikowan¹ wartoœæ daty/godziny
SELECT DATEADD(month, 1, '2006-08-31');

-- DATEDIFF ( datepart , startdate , enddate )
-- Ta funkcja zwraca liczbê (jako liczbê ca³kowit¹ ze znakiem) okreœlonych granic przedzia³ów dat 
-- przekroczonych miêdzy okreœlon¹ dat¹ pocz¹tkow¹ a dat¹ koñcow¹ .
SELECT DATEDIFF(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(quarter,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(month,       '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(dayofyear,   '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') as dayofyear_;
SELECT DATEDIFF(day,         '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(week,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(hour,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(minute,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(second,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(millisecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(microsecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000')

-- DATEPART ( datepart , date )
-- Ta funkcja zwraca liczbê ca³kowit¹ reprezentuj¹c¹ okreœlon¹ czêœæ daty okreœlonej daty .
SELECT DATEPART(year, '12:10:30.123')  
    ,DATEPART(month, '12:10:30.123')  
    ,DATEPART(day, '12:10:30.123')  
    ,DATEPART(dayofyear, '12:10:30.123')  
    ,DATEPART(weekday, '12:10:30.123');

	go

select DATENAME(WEEKDAY , getdate() )