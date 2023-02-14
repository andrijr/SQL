-- nie wykona transakcji select dopuki nie zako�czy transakcji 
set transaction isolation level read committed -- domy�lne ustawienie 
begin tran
select *  from tblEmployee
commit tran


-- wykona transakcje nawet jak poprzednia si� nie zako�czy�a - czytamy surowe dane niezatwierdzone
set transaction isolation level read uncommitted 
begin tran
select *  from tblEmployee
commit tran


-- 3
-- 
set transaction isolation level repeatable read  
begin tran
select *  from tblEmployee
waitfor delay '00:00:10'  -- czeka  10 sekund zanim przjdzie do nast�pnej transakcji
select *  from tblEmployee
commit tran

-- nie mo�na czyta� danych nie mo�na modyfikowa� danych i nie mo�na wstawia� nowych wierszy w zakresie ju� przeczytanych wierszy
 set transaction isolation level serializable --   
begin tran
select *  from tblEmployee
waitfor delay '00:00:10'  -- czeka  10 sekund zanim przjdzie do nast�pnej transakcji
select *  from tblEmployee
commit tran
