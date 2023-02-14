

declare @x xml
set @x = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

select @x as XMLColumn
go



declare @x xml
set @x = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

set @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]
				  with "6" ')  --w tej mietodzie wilkoœæ litier ma znaczenie nie mo¿esz napisaæ REPACE tylko replace
select @x as XMLColumn
go



declare @x xml
set @x = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

set @x.modify('insert <Item Cost="5">New Food</Item>
				into (/Shopping/ShoppingTrip)[1]')   --w tej mietodzie wilkoœæ litier ma znaczenie nie mo¿esz napisaæ INSERT tylko insert
set @x.modify('insert <Item Cost="7">New Food</Item>
				into (/Shopping/ShoppingTrip)[2]')   --w tej mietodzie wilkoœæ litier ma znaczenie nie mo¿esz napisaæ INSERT tylko insert
select @x as XMLColumn
go