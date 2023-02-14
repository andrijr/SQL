-- nie wykona transakcji select dopuki nie zakoñczy transakcji 
set transaction isolation level read committed -- domyœlne ustawienie 
begin tran
select *  from tblEmployee
commit tran


-- wykona transakcje nawet jak poprzednia siê nie zakoñczy³a - czytamy surowe dane niezatwierdzone
set transaction isolation level read uncommitted 
begin tran
select *  from tblEmployee
commit tran


-- 3
-- 
set transaction isolation level repeatable read  
begin tran
select *  from tblEmployee
waitfor delay '00:00:10'  -- czeka  10 sekund zanim przjdzie do nastêpnej transakcji
select *  from tblEmployee
commit tran

-- nie mo¿na czytaæ danych nie mo¿na modyfikowaæ danych i nie mo¿na wstawiaæ nowych wierszy w zakresie ju¿ przeczytanych wierszy
 set transaction isolation level serializable --   
begin tran
select *  from tblEmployee
waitfor delay '00:00:10'  -- czeka  10 sekund zanim przjdzie do nastêpnej transakcji
select *  from tblEmployee
commit tran
