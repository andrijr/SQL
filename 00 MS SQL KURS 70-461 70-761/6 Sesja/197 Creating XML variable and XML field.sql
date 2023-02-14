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

--select @x as XMLOutput

--alter table tblEmployee
--add XMLOutput xml null 

update tblEmployee
set XMLOutput = @x
where EmployeeNumber = 200 

select * 
from tblEmployee
where EmployeeNumber = 200


alter table tblEmployee
drop column XMLOutput 