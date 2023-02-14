select * from tblEmployee where EmployeeMiddleName is null


declare @myOption as varchar(10) = 'Option B'
select isnull (@myOption, 'No Option') as MyOptions
go

declare @myOption as varchar(10) --= 'Option B'
select isnull (@myOption, 'No Option') as MyOptions
go


declare @myFirstOption as varchar(10) = 'Option A'
declare @mySecondOption as varchar(10) = 'Option B'
select coalesce(@myFirstOption, @mySecondOption, 'No Option') as MyOptions
go


-- isnul bierze wszystko co jest niepustym typem danych
select isnull('ABC', 1) as MyAnswer1
select isnull(null , 1) as MyAnswer2
-- coalesce analizujê oba typy danych
select coalesce('ABC', 1) as MyOtherAnswer
go

-- isnull zwróci null
select isnull(null , null) as MyAnswer2
-- coalesce w tym przypadku zwróci b³¹d
select coalesce(null, null) as MyOtherAnswer
go
 

create table tblExample 
(myOption nvarchar(10) null)
go
insert into tblExample(myOption)
values ('Option A')
select * from tblExample


IF OBJECT_ID(N'dbo.tblIsCoalesce', N'U') IS NOT NULL  
drop table dbo.tblIsCoalesce

select coalesce(myOption, 'No option') as MyOption, null as colCoalesce
into tblIsCoalesce -- tworzy tabele domyœlnie z column¹ pozwalaj¹c¹ na null
from tblExample


IF OBJECT_ID(N'dbo.tblIsNull', N'U') IS NOT NULL  
drop table dbo.tblIsNull

select isnull(myOption, 'No option') as MyOption, null as colIsNull
into tblIsNull -- tworzy tabele domyœlnie z column¹ nie pozwalaj¹c¹ na null
from tblExample


select * from tblExample
select * from tblIsCoalesce
select * from tblIsNull

drop table tblExample
drop table  tblIsCoalesce
drop table  tblIsNull	

-- is null patrzy na pierwsz¹ wartoœæ sprawdza j¹ i je¿eli ok odrazu zwraca wynik czyli dzia³a szybciiej jak coaleasce
-- is null jest lepszy bo szybszy
-- is null jest lepszy w przypadku kiedy mamy dwa typy danych
-- coaleasce jest u¿ywana w innych serwerach równie¿ poza MSSQL
-- is null dzia³a w MS SQL i jak bêdziesz przenosiæ na inny serwer musisz pamiêtaæ aby zmienic na coaleasce


