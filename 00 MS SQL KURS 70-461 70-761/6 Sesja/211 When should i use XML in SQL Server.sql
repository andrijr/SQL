-- Staramy siê u¿ywaæ jak najmniej XML
-- xml dzia³a powoli
-- u¿ywa siê kiedy dane s¹ ¿adkie 
-- u¿ywa sie kiedy mamy oryginalne dane w XML
-- kiedy struktóra jest nieznana
-- kiedy nie zamierzasz czêœto aktualizowaæ danych


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