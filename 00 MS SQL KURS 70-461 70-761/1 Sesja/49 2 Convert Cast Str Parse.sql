

-- STR ( float_expression [ , length [ , decimal ] ] )

SELECT STR(123.45, 6, 1);  
GO
SELECT STR(123.45, 2, 2);  
-- Gdy wyra¿enie przekroczy okreœlon¹ d³ugoœæ, ³añcuch zwraca ** okreœlon¹ d³ugoœæ.
GO
SELECT STR (FLOOR (123.45), 8, 3);
GO

-- CAST Syntax:  
--CAST ( expression AS data_type [ ( length ) ] )  
  
-- CONVERT Syntax:  
--CONVERT ( data_type [ ( length ) ] , expression [ , style ] )

DECLARE @myval DECIMAL (5, 2);  
SET @myval = 193.57;  
SELECT CAST(CAST(@myval AS VARBINARY(20)) AS DECIMAL(10,5));  
-- Or, using CONVERT  
SELECT CONVERT(DECIMAL(10,5), CONVERT(VARBINARY(20), @myval));

SELECT  CAST(10.6496 AS INT) as trunc1,
        CAST(-10.6496 AS INT) as trunc2,
        CAST(10.6496 AS NUMERIC) as round1,
        CAST(-10.6496 AS NUMERIC) as round2;
		 

Declare @myval1 Decimal(10,5) =  10.2
select @myval1



select convert(varchar(10) , @myval1)
select cast(@myval1 as varchar(10))
select str(@myval1, 10, 3)


-- TRY_CAST ( expression AS data_type [ ( length ) ] )
-- TRY_CAST zwraca wartoœæ null w przypadku niepowodzenia

-- Poni¿szy przyk³ad pokazuje, ¿e TRY_CAST zwraca wartoœæ null w przypadku niepowodzenia rzutowania.
SELECT   
    CASE WHEN TRY_CAST('test' AS float) IS NULL   
    THEN 'Cast failed'  
    ELSE 'Cast succeeded'  
END AS Result;  
GO

-- Poni¿szy przyk³ad pokazuje, ¿e wyra¿enie musi mieæ oczekiwany format.
SET DATEFORMAT dmy;  
SELECT TRY_CAST('12/31/2010' AS datetime2) AS Result;  
GO

-- Poni¿szy przyk³ad pokazuje, ¿e TRY_CAST zwraca b³¹d, gdy rzutowanie jest jawnie niedozwolone
SELECT TRY_CAST(4 AS xml) AS Result;  
GO

-- TRY_CONVERT ( data_type [ ( length ) ], expression [, style ] )
-- Zwraca rzutowanie wartoœci na okreœlony typ danych, jeœli rzutowanie powiedzie siê; w przeciwnym razie zwraca wartoœæ null.

-- Poni¿szy przyk³ad pokazuje, ¿e TRY_CONVERT zwraca wartoœæ null, gdy rzutowanie nie powiedzie siê
SELECT   
    CASE WHEN TRY_CONVERT(float, 'test') IS NULL   
    THEN 'Cast failed'  
    ELSE 'Cast succeeded'  
END AS Result;  
GO

-- Poni¿szy przyk³ad pokazuje, ¿e wyra¿enie musi mieæ oczekiwany format.
SET DATEFORMAT dmy;  
SELECT TRY_CONVERT(datetime2, '12/31/2010') AS Result;  
GO

-- Poni¿szy przyk³ad pokazuje, ¿e TRY_CONVERT zwraca b³¹d, gdy rzutowanie jest jawnie niedozwolone.
SELECT TRY_CONVERT(xml, 4) AS Result;  
GO


-- TRY_PARSE ( string_value AS data_type [ USING culture ] )
-- Zwraca wynik wyra¿enia przet³umaczony na ¿¹dany typ danych lub wartoœæ null, jeœli rzutowanie nie powiedzie siê w SQL Server.
-- U¿ywaj TRY_PARSE tylko do konwersji z typu ³añcuchowego na typ daty/czasu i liczby.

SELECT TRY_PARSE('Jabberwokkie' AS datetime2 USING 'en-US') AS Result;

SELECT  
    CASE WHEN TRY_PARSE('Aragorn' AS decimal USING 'sr-Latn-CS') IS NULL  
        THEN 'True'  
        ELSE 'False'  
END  
AS Result;

SET LANGUAGE English;  
SELECT IIF(TRY_PARSE('01/01/2011' AS datetime2) IS NULL, 'True', 'False') AS Result;


-- PARSE ( string_value AS data_type [ USING culture ] )
-- Zwraca wynik wyra¿enia przet³umaczonego na ¿¹dany typ danych w SQL Server.

SELECT PARSE('Monday, 13 December 2010' AS datetime2 USING 'en-US') AS Result;