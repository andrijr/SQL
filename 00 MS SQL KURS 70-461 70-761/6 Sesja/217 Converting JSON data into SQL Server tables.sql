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

  select * from openjson(@json)

  select * from openjson(@json, '$.Shopping.Items')

  select * from openjson(@json, '$.Shopping.Items')
				with (Item varchar(10), Cost int)