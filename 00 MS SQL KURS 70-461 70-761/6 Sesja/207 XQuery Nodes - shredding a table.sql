declare @x1 xml, @x2 xml
set @x1 = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>'
set @x2 = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

drop table #tblXML
create table #tblXML(pkXML INT PRIMARY KEY , xmlCol  XML )

insert into #tblXML(pkXML, xmlCol ) values (1, @x1) 
insert into #tblXML(pkXML, xmlCol ) values (2, @x2) 

select * from #tblXML

select tbl.col.query('.')
from #tblXML cross apply
xmlCol.nodes( '/Shopping/ShoppingTrip') as tbl(col)
go




declare @x1 xml, @x2 xml
set @x1 = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>'
set @x2 = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

drop table #tblXML
create table #tblXML(pkXML INT PRIMARY KEY , xmlCol  XML )

insert into #tblXML(pkXML, xmlCol ) values (1, @x1) 
insert into #tblXML(pkXML, xmlCol ) values (2, @x2) 


select tbl.col.value('@Cost', 'varchar(50)')
from #tblXML cross apply -- urzywamy kiedy odpytujemy tabele xml
xmlCol.nodes( '/Shopping/ShoppingTrip/Item') as tbl(col)
go