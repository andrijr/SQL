-- JSON jest krutszy prostrzy i szybszy od XML

-- key:value, key:value
-- { key:value } - object
-- key:{ value } - wartoœæ mo¿e byæ objektem
-- { { } } - objekt w objekcie
-- [ { { } } ] - tablica zawiera kilka objektów

declare @json nvarchar(4000)
set @json = 
'
{
"name":"Philip",
"ShoppingTrip":1
}
'
select  @json
select  isjson(@json)
go



declare @json nvarchar(4000)
set @json = ' 
{
"name":"Philip",
"Shopping":
	{"ShoppingTrip":1
	"Items":
	{"Item":"Bananas", "Cost":5},
	{"Item":"Apples", "Cost":4}
	}
}
'
select  @json
select  isjson(@json)
go



declare @json nvarchar(4000)
set @json = ' 
{
"name":"Philip",
"Shopping":
	{"ShoppingTrip":1
	"Items":
	[
	{"Item":"Bananas", "Cost":5},
	{"Item":"Apples", "Cost":4},
	{"Item":"Cherries", "Cost":4}
	]
	}
}
'
select  @json
select  isjson(@json)