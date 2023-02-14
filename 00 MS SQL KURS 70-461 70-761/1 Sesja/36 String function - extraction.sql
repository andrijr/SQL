declare @myVar1 as varchar(10) = ' hello '
declare @myVar2 as nvarchar(10) = 'hello'

-- ASCII ( character_expression )  
-- Zwraca warto�� kodu ASCII skrajnego lewego znaku wyra�enia znakowego
SELECT ASCII('�')
-- UNICODE ( 'ncharacter_expression' ) 
-- Zwraca warto�� ca�kowit�, zgodnie z definicj� w standardzie Unicode, dla pierwszego znaku wyra�enia wej�ciowego.
SELECT UNICODE('�')

-- CHAR ( integer_expression )
-- Zwraca znak jednobajtowy z okre�lonym kodem liczby ca�kowitej, zgodnie z definicj� zestawu znak�w i kodowania domy�lnego sortowania bie��cej bazy danych.
select char(77)

-- NCHAR ( integer_expression )
-- Zwraca znak Unicode z okre�lonym kodem ca�kowitym, zgodnie z definicj� w standardzie Unicode.
select nchar(77)

-- CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )
-- Ta funkcja wyszukuje jedno wyra�enie znakowe wewn�trz drugiego wyra�enia znakowego, zwracaj�c pozycj� pocz�tkow� pierwszego wyra�enia, 
-- je�li zosta�o znalezione.
SELECT CHARINDEX('l', 'hello hello', 5); 


-- QUOTENAME ( 'character_string' [ , 'quote_character' ] )
-- Zwraca ci�g Unicode z dodanymi ogranicznikami, aby ci�g wej�ciowy by� prawid�owym identyfikatorem rozdzielanym programu SQL Server.
SELECT QUOTENAME('abc[]def');
SELECT QUOTENAME('abc def');


-- FORMAT( value, format [, culture ] )
-- Zwraca warto�� sformatowan� przy u�yciu okre�lonego 
DECLARE @d DATE = '11/22/2020';
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English' 
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'Date'  
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm tt')
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') -- returns 14:00
select FORMAT(12569, 'N', 'en-us') 
select FORMAT(12569, 'G', 'en-us') 
select FORMAT(12569, 'C', 'en-us') 

-- CONCAT ( string_value1, string_value2 [, string_valueN ] )
-- Ta funkcja zwraca �a�cuch b�d�cy wynikiem konkatenacji lub ��czenia dw�ch lub wi�cej warto�ci ci�gu w spos�b kompleksowy.
-- (Aby doda� warto�� oddzielaj�c� podczas konkatenacji, zobacz CONCAT_WS
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;


-- CONCAT_WS ( separator, argument1, argument2 [, argumentN]... )
SELECT CONCAT_WS( ' - ', database_id, recovery_model_desc, containment_desc) AS DatabaseInfo
FROM sys.databases;

-- Ten przyk�ad ignoruje NULLwarto�ci na li�cie argument�w.
SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address;

-- W tym przyk�adzie u�yto przecinka ,jako warto�ci separatora i dodano znak powrotu karetki char(13)
--w formacie warto�ci rozdzielanych kolumnami zestawu wynik�w.
SELECT 
STRING_AGG(CONCAT_WS( ',', database_id, recovery_model_desc, containment_desc), char(13)) AS DatabaseInfo
FROM sys.databases

go 
DECLARE @myVar1 varchar(50) = 'hello';
-- LEFT ( character_expression , integer_expression )
select left(@myVar1,4)
-- RIGHT ( character_expression , integer_expression )
select right(@myVar1,4)

-- SUBSTRING ( expression ,start , length 
-- Zwraca cz�� wyra�enia znakowego, binarnego, tekstowego lub graficznego w SQL Server.
select substring(@myVar1,3,4) as subst

-- LTRIM ( character_expression , [ characters ] )
select ltrim(@myVar1)
-- Poni�szy przyk�ad usuwa znaki 123 z pocz�tku ci�gu 123abc..
SELECT LTRIM('123abc.' , '123.');
-- RTRIM ( character_expression , [ characters ] )
select rtrim(@myVar1)
-- Poni�szy przyk�ad usuwa znaki abc.z ko�ca ci�gu .123abc..
SELECT RTRIM('.123abc.' , 'abc.');

-- TRIM ( [ LEADING | TRAILING | BOTH ] [characters FROM ] string )
-- LEADING usuwa znaki okre�lone na pocz�tku �a�cucha.
-- TRAILING usuwa okre�lone znaki z ko�ca �a�cucha.
-- BOTH (domy�lne zachowanie pozycyjne) usuwa okre�lone znaki z pocz�tku i ko�ca �a�cucha.

-- Poni�szy przyk�ad usuwa spacje przed i po wyrazie test.
SELECT TRIM( '     test    ') AS Result;
-- Poni�szy przyk�ad zawiera list� mo�liwych znak�w do usuni�cia z ci�gu.
SELECT TRIM( '.,! ' FROM '     #     test    .') AS Result;
-- Poni�szy przyk�ad usuwa interlini� .z pocz�tku ci�gu przed wyrazem test.
SELECT TRIM(LEADING '.,! ' FROM  '     .#     test    .') AS Result;
-- Poni�szy przyk�ad usuwa ko�cowy ci�g .z ko�ca ci�gu po s�owie test.
SELECT TRIM(TRAILING '.,! ' FROM '     .#     test    .') AS Result;
-- Poni�szy przyk�ad usuwa znaki 123z pocz�tku i ko�ca �a�cucha 123abc123.
SELECT TRIM(BOTH '123' FROM '123abc123') AS Result;


-- REPLICATE ( string_expression , integer_expression )
-- Powtarza warto�� ci�gu okre�lon� liczb� razy
select replicate('as_', 5)

-- REPLACE ( string_expression , string_pattern , string_replacement )
-- Zast�puje wszystkie wyst�pienia okre�lonej warto�ci ci�gu inn� warto�ci� ci�gu.
select replace(@myVar1, 'l', 'L')

-- LEN ( string_expression )
--Zwraca liczb� znak�w okre�lonego wyra�enia �a�cuchowego, z wy��czeniem ko�cowych spacji.
select len(' hello  ')

-- SPACE ( integer_expression )
-- Zwraca ci�g powtarzaj�cych si� spacji.
select 'a' + space(5) + 'b'

-- REVERSE ( string_expression )
-- Zwraca odwrotn� kolejno�� warto�ci ci�gu.
select reverse('hello')

-- TRANSLATE ( inputString, characters, translations )
-- Zwraca ci�g podany jako pierwszy argument po przet�umaczeniu niekt�rych znak�w okre�lonych w drugim argumencie 
-- na docelowy zestaw znak�w okre�lony w trzecim argumencie.
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');

-- UPPER ( character_expression )
-- Zwraca wyra�enie znakowe z ma�ymi literami przekonwertowanymi na wielkie.
select upper('hello')

-- LOWER ( character_expression )
-- Zwraca wyra�enie znakowe po przekonwertowaniu danych wielkich liter na ma�e.
select LOWER('HELLO')



-- STR ( float_expression [ , length [ , decimal ] ] )
-- Zwraca dane znakowe przekonwertowane z danych liczbowych. Dane znakowe s� wyr�wnane do prawej, z okre�lon� d�ugo�ci� i dok�adno�ci� dziesi�tn�.
SELECT STR(123.45, 6, 1);  

-- STRING_AGG ( expression, separator ) [ <order_clause> ]
-- Opcjonalnie okre�l kolejno�� po��czonych wynik�w za pomoc� WITHIN GROUP klauzuli:
-- WITHIN GROUP ( ORDER BY <order_by_expression_list> [ ASC | DESC ] )
-- ��czy warto�ci wyra�e� �a�cuchowych i umieszcza mi�dzy nimi warto�ci separatora. Separator nie jest dodawany na ko�cu �a�cucha.

-- dodaje warto�ci jednej kolumny do jednej kom�rki po spacji char(13)
USE AdventureWorks2019
GO
SELECT STRING_AGG (CONVERT(NVARCHAR(max),FirstName), CHAR(13)) AS csv 
FROM Person.Person;
GO

-- Poni�szy przyk�ad zast�puje warto�ci null ci�giem �N/D� i zwraca nazwy oddzielone przecinkami w pojedynczej kom�rce wynikowej.
USE AdventureWorks2019
GO
SELECT STRING_AGG(CONVERT(NVARCHAR(max), ISNULL(FirstName,'N/A')), ',') AS csv 
FROM Person.Person;
GO

-- STRING_SPLIT ( string , separator [ , enable_ordinal ] )
-- Funkcja z warto�ciami przechowywanymi w tabeli, kt�ra dzieli ci�g na wiersze podci�g�w na podstawie okre�lonego znaku separatora.
-- STRING_SPLIT wymaga poziomu zgodno�ci co najmniej 130. Gdy poziom jest mniejszy ni� 130, SQL Server nie mo�e znale�� funkcji STRING_SPLIT.
SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');


-- STRING_ESCAPE( text , type )
-- Zmienia znaki specjalne w tekstach i zwraca tekst ze znakami specjalnymi. STRING_ESCAPE to funkcja deterministyczna wprowadzona w SQL Server 2016.
SELECT STRING_ESCAPE('\   /  \\    "     ', 'json') AS escapedText;

-- STUFF ( character_expression , start , length , replaceWith_expression )
-- Funkcja STUFF wstawia ci�g do innego ci�gu. Usuwa okre�lon� d�ugo�� znak�w w pierwszym ci�gu na pozycji pocz�tkowej,
-- a nast�pnie wstawia drugi ci�g do pierwszego ci�gu na pozycji pocz�tkowej.
SELECT STUFF('abcdef', 2, 3, 'ijklmn');  

-- SOUNDEX ( character_expression )
-- Zwraca czteroznakowy kod (SOUNDEX) w celu oceny podobie�stwa dw�ch ci�g�w znak�w.
-- Using SOUNDEX
SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');

-- DIFFERENCE ( character_expression , character_expression )
-- Ta funkcja zwraca warto�� ca�kowit� mierz�c� r�nic� mi�dzy warto�ciami SOUNDEX() dw�ch r�nych wyra�e� znakowych.
-- Using DIFFERENCE  
SELECT DIFFERENCE('Smithers', 'Smythers');  









-- FORMATMESSAGE ( { msg_number  | ' msg_string ' | @msg_variable} , [ param_value [ ,...n ] ] )
-- Funkcjonalno�� FORMATMESSAGE przypomina instrukcj� RAISERROR. 
-- Jednak RAISERROR drukuje wiadomo�� natychmiast, podczas gdy FORMATMESSAGE zwraca sformatowan� wiadomo�� do dalszego przetwarzania.

SELECT FORMATMESSAGE('Signed int %i, %d %i, %d, %+i, %+d, %+i, %+d', 5, -5, 50, -50, -11, -11, 11, 11);
SELECT FORMATMESSAGE('Signed int with up to 3 leading zeros %03i', 5);  
SELECT FORMATMESSAGE('Signed int with up to 20 leading zeros %020i', 5);  
SELECT FORMATMESSAGE('Signed int with leading zero 0 %020i', -55);  
SELECT FORMATMESSAGE('Bigint %I64d', 3000000000);
SELECT FORMATMESSAGE('Unsigned int %u, %u', 50, -50);  
SELECT FORMATMESSAGE('Unsigned octal %o, %o', 50, -50);  
SELECT FORMATMESSAGE('Unsigned hexadecimal %x, %X, %X, %X, %x', 11, 11, -11, 50, -50);  
SELECT FORMATMESSAGE('Unsigned octal with prefix: %#o, %#o', 50, -50);  
SELECT FORMATMESSAGE('Unsigned hexadecimal with prefix: %#x, %#X, %#X, %X, %x', 11, 11, -11, 50, -50);  
SELECT FORMATMESSAGE('Hello %s!', 'TEST');  
SELECT FORMATMESSAGE('Hello %20s!', 'TEST');  
SELECT FORMATMESSAGE('Hello %-20s!', 'TEST');

SELECT text FROM sys.messages WHERE message_id = 20009 AND language_id = 1033;  
DECLARE @var1 VARCHAR(200);   
SELECT @var1 = FORMATMESSAGE(20009, 'First Variable', 'Second Variable');   
SELECT @var1;



-- Generuje komunikat o b��dzie i inicjuje przetwarzanie b��d�w dla sesji.
-- RAISERRORmo�e odwo�ywa� si� do komunikatu zdefiniowanego przez u�ytkownika przechowywanego w sys.messages
-- widoku katalogu lub tworzy� komunikat dynamicznie.
RAISERROR (15600, -1, -1, 'mysp_CreateCustomer');