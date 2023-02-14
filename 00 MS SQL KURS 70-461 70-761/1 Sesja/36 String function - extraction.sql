declare @myVar1 as varchar(10) = ' hello '
declare @myVar2 as nvarchar(10) = 'hello'

-- ASCII ( character_expression )  
-- Zwraca wartoœæ kodu ASCII skrajnego lewego znaku wyra¿enia znakowego
SELECT ASCII('³')
-- UNICODE ( 'ncharacter_expression' ) 
-- Zwraca wartoœæ ca³kowit¹, zgodnie z definicj¹ w standardzie Unicode, dla pierwszego znaku wyra¿enia wejœciowego.
SELECT UNICODE('³')

-- CHAR ( integer_expression )
-- Zwraca znak jednobajtowy z okreœlonym kodem liczby ca³kowitej, zgodnie z definicj¹ zestawu znaków i kodowania domyœlnego sortowania bie¿¹cej bazy danych.
select char(77)

-- NCHAR ( integer_expression )
-- Zwraca znak Unicode z okreœlonym kodem ca³kowitym, zgodnie z definicj¹ w standardzie Unicode.
select nchar(77)

-- CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )
-- Ta funkcja wyszukuje jedno wyra¿enie znakowe wewn¹trz drugiego wyra¿enia znakowego, zwracaj¹c pozycjê pocz¹tkow¹ pierwszego wyra¿enia, 
-- jeœli zosta³o znalezione.
SELECT CHARINDEX('l', 'hello hello', 5); 


-- QUOTENAME ( 'character_string' [ , 'quote_character' ] )
-- Zwraca ci¹g Unicode z dodanymi ogranicznikami, aby ci¹g wejœciowy by³ prawid³owym identyfikatorem rozdzielanym programu SQL Server.
SELECT QUOTENAME('abc[]def');
SELECT QUOTENAME('abc def');


-- FORMAT( value, format [, culture ] )
-- Zwraca wartoœæ sformatowan¹ przy u¿yciu okreœlonego 
DECLARE @d DATE = '11/22/2020';
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English' 
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'Date'  
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm tt')
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') -- returns 14:00
select FORMAT(12569, 'N', 'en-us') 
select FORMAT(12569, 'G', 'en-us') 
select FORMAT(12569, 'C', 'en-us') 

-- CONCAT ( string_value1, string_value2 [, string_valueN ] )
-- Ta funkcja zwraca ³añcuch bêd¹cy wynikiem konkatenacji lub ³¹czenia dwóch lub wiêcej wartoœci ci¹gu w sposób kompleksowy.
-- (Aby dodaæ wartoœæ oddzielaj¹c¹ podczas konkatenacji, zobacz CONCAT_WS
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;


-- CONCAT_WS ( separator, argument1, argument2 [, argumentN]... )
SELECT CONCAT_WS( ' - ', database_id, recovery_model_desc, containment_desc) AS DatabaseInfo
FROM sys.databases;

-- Ten przyk³ad ignoruje NULLwartoœci na liœcie argumentów.
SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address;

-- W tym przyk³adzie u¿yto przecinka ,jako wartoœci separatora i dodano znak powrotu karetki char(13)
--w formacie wartoœci rozdzielanych kolumnami zestawu wyników.
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
-- Zwraca czêœæ wyra¿enia znakowego, binarnego, tekstowego lub graficznego w SQL Server.
select substring(@myVar1,3,4) as subst

-- LTRIM ( character_expression , [ characters ] )
select ltrim(@myVar1)
-- Poni¿szy przyk³ad usuwa znaki 123 z pocz¹tku ci¹gu 123abc..
SELECT LTRIM('123abc.' , '123.');
-- RTRIM ( character_expression , [ characters ] )
select rtrim(@myVar1)
-- Poni¿szy przyk³ad usuwa znaki abc.z koñca ci¹gu .123abc..
SELECT RTRIM('.123abc.' , 'abc.');

-- TRIM ( [ LEADING | TRAILING | BOTH ] [characters FROM ] string )
-- LEADING usuwa znaki okreœlone na pocz¹tku ³añcucha.
-- TRAILING usuwa okreœlone znaki z koñca ³añcucha.
-- BOTH (domyœlne zachowanie pozycyjne) usuwa okreœlone znaki z pocz¹tku i koñca ³añcucha.

-- Poni¿szy przyk³ad usuwa spacje przed i po wyrazie test.
SELECT TRIM( '     test    ') AS Result;
-- Poni¿szy przyk³ad zawiera listê mo¿liwych znaków do usuniêcia z ci¹gu.
SELECT TRIM( '.,! ' FROM '     #     test    .') AS Result;
-- Poni¿szy przyk³ad usuwa interliniê .z pocz¹tku ci¹gu przed wyrazem test.
SELECT TRIM(LEADING '.,! ' FROM  '     .#     test    .') AS Result;
-- Poni¿szy przyk³ad usuwa koñcowy ci¹g .z koñca ci¹gu po s³owie test.
SELECT TRIM(TRAILING '.,! ' FROM '     .#     test    .') AS Result;
-- Poni¿szy przyk³ad usuwa znaki 123z pocz¹tku i koñca ³añcucha 123abc123.
SELECT TRIM(BOTH '123' FROM '123abc123') AS Result;


-- REPLICATE ( string_expression , integer_expression )
-- Powtarza wartoœæ ci¹gu okreœlon¹ liczbê razy
select replicate('as_', 5)

-- REPLACE ( string_expression , string_pattern , string_replacement )
-- Zastêpuje wszystkie wyst¹pienia okreœlonej wartoœci ci¹gu inn¹ wartoœci¹ ci¹gu.
select replace(@myVar1, 'l', 'L')

-- LEN ( string_expression )
--Zwraca liczbê znaków okreœlonego wyra¿enia ³añcuchowego, z wy³¹czeniem koñcowych spacji.
select len(' hello  ')

-- SPACE ( integer_expression )
-- Zwraca ci¹g powtarzaj¹cych siê spacji.
select 'a' + space(5) + 'b'

-- REVERSE ( string_expression )
-- Zwraca odwrotn¹ kolejnoœæ wartoœci ci¹gu.
select reverse('hello')

-- TRANSLATE ( inputString, characters, translations )
-- Zwraca ci¹g podany jako pierwszy argument po przet³umaczeniu niektórych znaków okreœlonych w drugim argumencie 
-- na docelowy zestaw znaków okreœlony w trzecim argumencie.
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');

-- UPPER ( character_expression )
-- Zwraca wyra¿enie znakowe z ma³ymi literami przekonwertowanymi na wielkie.
select upper('hello')

-- LOWER ( character_expression )
-- Zwraca wyra¿enie znakowe po przekonwertowaniu danych wielkich liter na ma³e.
select LOWER('HELLO')



-- STR ( float_expression [ , length [ , decimal ] ] )
-- Zwraca dane znakowe przekonwertowane z danych liczbowych. Dane znakowe s¹ wyrównane do prawej, z okreœlon¹ d³ugoœci¹ i dok³adnoœci¹ dziesiêtn¹.
SELECT STR(123.45, 6, 1);  

-- STRING_AGG ( expression, separator ) [ <order_clause> ]
-- Opcjonalnie okreœl kolejnoœæ po³¹czonych wyników za pomoc¹ WITHIN GROUP klauzuli:
-- WITHIN GROUP ( ORDER BY <order_by_expression_list> [ ASC | DESC ] )
-- £¹czy wartoœci wyra¿eñ ³añcuchowych i umieszcza miêdzy nimi wartoœci separatora. Separator nie jest dodawany na koñcu ³añcucha.

-- dodaje wartoœci jednej kolumny do jednej komórki po spacji char(13)
USE AdventureWorks2019
GO
SELECT STRING_AGG (CONVERT(NVARCHAR(max),FirstName), CHAR(13)) AS csv 
FROM Person.Person;
GO

-- Poni¿szy przyk³ad zastêpuje wartoœci null ci¹giem „N/D” i zwraca nazwy oddzielone przecinkami w pojedynczej komórce wynikowej.
USE AdventureWorks2019
GO
SELECT STRING_AGG(CONVERT(NVARCHAR(max), ISNULL(FirstName,'N/A')), ',') AS csv 
FROM Person.Person;
GO

-- STRING_SPLIT ( string , separator [ , enable_ordinal ] )
-- Funkcja z wartoœciami przechowywanymi w tabeli, która dzieli ci¹g na wiersze podci¹gów na podstawie okreœlonego znaku separatora.
-- STRING_SPLIT wymaga poziomu zgodnoœci co najmniej 130. Gdy poziom jest mniejszy ni¿ 130, SQL Server nie mo¿e znaleŸæ funkcji STRING_SPLIT.
SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');


-- STRING_ESCAPE( text , type )
-- Zmienia znaki specjalne w tekstach i zwraca tekst ze znakami specjalnymi. STRING_ESCAPE to funkcja deterministyczna wprowadzona w SQL Server 2016.
SELECT STRING_ESCAPE('\   /  \\    "     ', 'json') AS escapedText;

-- STUFF ( character_expression , start , length , replaceWith_expression )
-- Funkcja STUFF wstawia ci¹g do innego ci¹gu. Usuwa okreœlon¹ d³ugoœæ znaków w pierwszym ci¹gu na pozycji pocz¹tkowej,
-- a nastêpnie wstawia drugi ci¹g do pierwszego ci¹gu na pozycji pocz¹tkowej.
SELECT STUFF('abcdef', 2, 3, 'ijklmn');  

-- SOUNDEX ( character_expression )
-- Zwraca czteroznakowy kod (SOUNDEX) w celu oceny podobieñstwa dwóch ci¹gów znaków.
-- Using SOUNDEX
SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');

-- DIFFERENCE ( character_expression , character_expression )
-- Ta funkcja zwraca wartoœæ ca³kowit¹ mierz¹c¹ ró¿nicê miêdzy wartoœciami SOUNDEX() dwóch ró¿nych wyra¿eñ znakowych.
-- Using DIFFERENCE  
SELECT DIFFERENCE('Smithers', 'Smythers');  









-- FORMATMESSAGE ( { msg_number  | ' msg_string ' | @msg_variable} , [ param_value [ ,...n ] ] )
-- Funkcjonalnoœæ FORMATMESSAGE przypomina instrukcjê RAISERROR. 
-- Jednak RAISERROR drukuje wiadomoœæ natychmiast, podczas gdy FORMATMESSAGE zwraca sformatowan¹ wiadomoœæ do dalszego przetwarzania.

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



-- Generuje komunikat o b³êdzie i inicjuje przetwarzanie b³êdów dla sesji.
-- RAISERRORmo¿e odwo³ywaæ siê do komunikatu zdefiniowanego przez u¿ytkownika przechowywanego w sys.messages
-- widoku katalogu lub tworzyæ komunikat dynamicznie.
RAISERROR (15600, -1, -1, 'mysp_CreateCustomer');