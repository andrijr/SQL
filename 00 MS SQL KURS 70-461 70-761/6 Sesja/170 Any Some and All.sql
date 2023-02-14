-- any = some <> in

select *
from  tblTransaction as t
where t.EmployeeNumber   in 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber


select *
from  tblTransaction as t
where t.EmployeeNumber   = any 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber


select *
from  tblTransaction as t
where t.EmployeeNumber   = some 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber



select *
from  tblTransaction as t
where t.EmployeeNumber   not in 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber


select *
from  tblTransaction as t
where t.EmployeeNumber   <> any -- to nie dzia³a poprawnie
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber


select *
from  tblTransaction as t
where t.EmployeeNumber   <> some -- to nie dzia³a poprawnie
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber

-- 126 <> any (126, 127, 128, 129)  -- true
-- 127 <> any (126, 127, 128, 129)  -- true
-- 128 <> any (126, 127, 128, 129)  -- true
-- 129 <> any (126, 127, 128, 129)  -- true
-- 130 <> any (126, 127, 128, 129)  -- false



select *
from  tblTransaction as t
where t.EmployeeNumber   <> all
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber

-- 126 <> all (126, 127, 128, 129)  -- false
-- 127 <> all (126, 127, 128, 129)  -- false
-- 128 <> all (126, 127, 128, 129)  -- false
-- 129 <> all (126, 127, 128, 129)  -- false
-- 130 <> any (126, 127, 128, 129)  -- false

-- any / some =  OR
-- all = AND

-- 126 <> all (126, 127, 128, 129)  
-- 126 <> 126 and 126<>127 and 126<>128 and 126<>129
-- False and true and true and true = false

-- 126 <> any (126, 127, 128, 129)  
-- 126 <> 126 or 126<>127 or 126<>128 or 126<>129
-- False or true or true or true = true



--  <> all -- jest u¿ywany
--  = all  -- nie jest u¿ywany

--  <> any/some -- nie jest u¿ywany
--  = any/some  --  jest u¿ywany


select *
from  tblTransaction as t
where t.EmployeeNumber   <= any -- some
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber

-- <= any / some (126, 127, 128, 129)
-- anything up to 126 or
-- anything up to 127 or
-- anything up to 128 or
-- anything up to 129


select *
from  tblTransaction as t
where t.EmployeeNumber   <= all 
( select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%' )
order by t.EmployeeNumber

-- <= all (126, 127, 128, 129)
-- anything up to 126 and
-- anything up to 127 and
-- anything up to 128 and
-- anything up to 129 

-- any = anything up to 129 
-- all = anything up to 126
 