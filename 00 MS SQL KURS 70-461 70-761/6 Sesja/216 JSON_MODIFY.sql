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

  select Json_Value(@json, 'strict $.Shopping.Items[0].Item') 
  
  -- json_modify wymaga 3 elementy
  select Json_Modify(@json, 'strict $.Shopping.Items[0].Item', 'Big Bananas') 

  select Json_Modify(@json, 'strict $.Shopping.Items[0]', json_query('{"Item":"Big Bananas", "Cost":1}' )  )

  select JSON_MODIFY( @json , '$.Date', '2022-01-01')


  select Json_Value(@json, 'strict $.Shopping.Items[0].Item') 