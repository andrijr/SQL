declare @json NVARCHAR(4000)
SET @json = '
{"name" : "Phillip",
 "Shopping":
	{"ShoppingTrip": 1,
	"Items":
	[
		{"Item":"Bananas", "Cost":5}, 
		{"Item":"Apples", "Cost":4}, 
		{"Item":"Cherries", "Cost":3} 
	]
	}
	}
'


  select * from openjson(@json, '$.Shopping.Items')
				with (Item varchar(10), Cost int)

select 'Bananas' as Item , 5 as Cost
union 
select 'Apples' as Item , 4 as Cost
union 
select 'Cherries' as Item , 3 as Cost


select 'Bananas' as Item , 5 as Cost
union 
select 'Apples'  , 4 
union 
select 'Cherries', 3 


select 'Bananas' as Item , 5 as Cost
union 
select 'Apples'  , 4 
union 
select 'Cherries', 3 
for xml path


select 'Bananas' as Item , 5 as Cost
union 
select 'Apples'  , 4 
union 
select 'Cherries', 3 
for json path


select 'Bananas' as Item , 5 as Cost
union 
select 'Apples'  , 4 
union 
select 'Cherries', 3 
for json path, root ('Items')

