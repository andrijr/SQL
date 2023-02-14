
-- json_value - returns 1 value
-- json_query - returns an object or array

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
select JSON_QUERY(@json,'$')

select JSON_QUERY(@json, '$.Shopping')

 select JSON_QUERY(@json, '$.Shopping.Items')

 -- zwraca null bo wielkoœæ liter ma znaczenie
 select Json_Value(@json,'$.Name')

 select Json_Value(@json,'$.name')

 --select Json_Value(@json, 'strict $.Name') -- je¿eli podamy strict nie zwróci null tylko b³¹d

  select Json_Value(@json, 'strict $.Shopping.ShoppingTrip') 

  select Json_Value(@json, 'strict $.Shopping.Items[0].Item') 
  select Json_Value(@json, 'strict $.Shopping.Items[1].Item') 
  select Json_Value(@json, 'strict $.Shopping.Items[0].Cost') 
  select Json_Value(@json, 'strict $.Shopping.Items[1].Cost') 