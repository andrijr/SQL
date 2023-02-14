
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

-- g��wny indeks
create primary xml index pk_tblXML on #tblXML(xmlCol) 

-- wt�rny indeks
create  xml index secpk_tblXML_Path on #tblXML(xmlCol) 
			using xml index pk_tblXML FOR PATH 

create  xml index secpk_tblXML_Value on #tblXML(xmlCol) 
			using xml index pk_tblXML FOR VALUE --nadaj� si� kiedy uzywamy symboli wieloznacznych

create  xml index secpk_tblXML_Property on #tblXML(xmlCol) 
			using xml index pk_tblXML FOR PROPERTY -- nadaj� si� kiedy pobieranych jest wiele warto�ci

select * from #tblXML

select tbl.col.query('.')
from #tblXML cross apply
xmlCol.nodes( '/Shopping/ShoppingTrip') as tbl(col)
go