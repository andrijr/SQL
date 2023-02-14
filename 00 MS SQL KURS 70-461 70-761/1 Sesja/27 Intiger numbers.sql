-- sql server book
-- https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

/*
Exact numerics

bit - An integer data type that can take a value of 1, 0, or NULL.
tinyint
smallint
int
bigint
money
smallmoney
numeric
decimal
*/



/*
bigint	-2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)	8 Bytes
int	-2^31 (-2,147,483,648) to 2^31-1 (2,147,483,647)	4 Bytes
smallint	-2^15 (-32,768) to 2^15-1 (32,767)	2 Bytes
tinyint	0 to 255	1 Byte
*/

-- 1 bajt 0-255
DECLARE @myvar1 as tinyint = 255
-- jak wpiszemy liczbê wiêksz¹  spowodujê to b³¹d
--set @myvar1 = -5
select @myvar1
DECLARE @myvar2 as smallint = 32767
DECLARE @myvar3 as int = 2
DECLARE @myvar4 as bigint = 2

/*
money	-922,337,203,685,477.5808 to 922,337,203,685,477.5807 (-922,337,203,685,477.58
to 922,337,203,685,477.58 for Informatica. Informatica only supports two decimals, not four.)	8 bytes
smallmoney	- 214,748.3648 to 214,748.3647
*/


DECLARE @mymoney_sm SMALLMONEY = 3148.29,  
        @mymoney    MONEY = 3148.29;  
SELECT  CAST(@mymoney_sm AS VARCHAR) AS 'SM_MONEY varchar',  
        CAST(@mymoney AS DECIMAL)    AS 'MONEY DECIMAL';



DECLARE @MyDecimalColumn as DECIMAL(5,2)  = 123
DECLARE @MyNumericColumn as NUMERIC(10,5)  = 12345.12

select @MyDecimalColumn , @MyNumericColumn



/*
Approximate numerics

float
real
*/

/*
float	- 1.79E+308 to -2.23E-308, 0 and 2.23E-308 to 1.79E+308	Depends on the value of n 1-24 = 4 or n 25-553 =8 Bytes 
real	- 3.40E + 38 to -1.18E - 38, 0 and 1.18E - 38 to 3.40E + 38	4 Bytes

When you want to convert from float or real to character data, using the STR string function is usually more useful than CAST( ). 
This is because STR enables more control over formatting.

*/

-- real is float(24).

select convert(float(24), 22.25)
select convert(real, 22.25

/*
Date and time

time	12:35:29. 1234567
date	2007-05-08
smalldatetime	2007-05-08 12:35:00
datetime	2007-05-08 12:35:29.123
datetime2	2007-05-08 12:35:29.1234567
datetimeoffset	2007-05-08 12:35:29.1234567 +12:15
*/

SELECT   
     CAST('2007-05-08 12:35:29. 1234567 +12:15' AS time(7)) AS 'time'   
    ,CAST('2007-05-08 12:35:29. 1234567 +12:15' AS date) AS 'date'   
    ,CAST('2007-05-08 12:35:29.123' AS smalldatetime) AS    'smalldatetime'   
    ,CAST('2007-05-08 12:35:29.123' AS datetime) AS 'datetime'   
    ,CAST('2007-05-08 12:35:29. 1234567 +12:15' AS datetime2(7)) AS   'datetime2'  
    ,CAST('2007-05-08 12:35:29.1234567 +12:15' AS datetimeoffset(7)) AS   'datetimeoffset';


/*
Character strings

char   char [ ( n ) ]   
nchar [ ( n ) ]
varchar  varchar [ ( n | max ) ]
nvarchar [ ( n | max ) ]

text 

Typu danych Char mo¿na u¿yæ, gdy oczekujemy, ¿e wartoœci danych w kolumnie bêd¹ tej samej d³ugoœci.	
Typu danych Varchar mo¿na u¿yæ, gdy oczekujemy, ¿e wartoœci danych w kolumnie bêd¹ mia³y zmienn¹ d³ugoœæ.

Typy danych ntext , text i image zostan¹ usuniête w przysz³ej wersji programu SQL Server.
Unikaj u¿ywania tych typów danych w nowych pracach programistycznych i planuj modyfikowanie aplikacji, które obecnie ich u¿ywaj¹.
Zamiast tego u¿yj nvarchar(max) , varchar(max) i varbinary(max) .

nchar and nvarchar can store Unicode characters.
char and varchar cannot store Unicode characters.
char and nchar are fixed-length which will reserve storage space for number of characters you specify even if you don't use up all that space.
varchar and nvarchar are variable-length which will only use up spaces for the characters you store. It will not reserve storage like char or nchar.

*/

DECLARE @myVariable AS VARCHAR = 'abc';
DECLARE @myNextVariable AS CHAR = 'abc';
--The following returns 1
SELECT DATALENGTH(@myVariable), DATALENGTH(@myNextVariable);
GO

DECLARE @myVariable AS VARCHAR(40);
SET @myVariable = 'This string is longer than thirty characters';
SELECT CAST(@myVariable AS VARCHAR);
SELECT DATALENGTH(CAST(@myVariable AS VARCHAR)) AS 'VarcharDefaultLength';
SELECT CONVERT(CHAR, @myVariable);
SELECT DATALENGTH(CONVERT(CHAR, @myVariable)) AS 'VarcharDefaultLength';

Declare @myVariable1 as Varchar(50) = 'Test test'
Declare @myVariable2 as Char(50) = 'Test test'
select DATALENGTH(@myVariable1), DATALENGTH(@myVariable2)

--DATALENGTH ( expression )
select DATALENGTH('interesting data')
-- PATINDEX ( '%pattern%' , expression )
SELECT position = PATINDEX('%ter%', 'interesting data');
-- SUBSTRING ( expression ,start , length )
SELECT x = SUBSTRING('abcdef', 2, 3);

-- COLLATE { <collation_name> | database_default } <collation_name> :: =     { Windows_collation_name } | { SQL_collation_name }
use AdventureWorks2019
SELECT City FROM [Person].[Address]
ORDER BY City
COLLATE Latin1_General_CS_AS_KS_WS ASC;
GO

/*
Binary strings

binary  binary [ ( n ) ]  Dane binarne o sta³ej d³ugoœci i d³ugoœci n bajtów
varbinary varbinary [ ( n | max ) ]  Dane binarne o zmiennej d³ugoœci
varbinarny (maks.)	wpisy danych w kolumnie przekraczaj¹ 8000 bajtów.

image -- usuniêto
*/

DECLARE @BinaryVariable2 BINARY(2);
  
SET @BinaryVariable2 = 123456;
SET @BinaryVariable2 = @BinaryVariable2 + 1;
  
SELECT CAST( @BinaryVariable2 AS INT);
GO

/*
Other data types

cursor
rowversion
hierarchyid
uniqueidentifier
sql_variant
xml
Spatial Geometry Types
Spatial Geography Types
table

*/

-- xml [ ( [ CONTENT | DOCUMENT ] xml_schema_collection ) ]
USE  [AdventureWorks2019]
GO  
DECLARE @DemographicData XML (Person.IndividualSurveySchemaCollection);  
SET @DemographicData = (SELECT TOP 1 Demographics FROM Person.Person);  
SELECT @DemographicData;  
GO