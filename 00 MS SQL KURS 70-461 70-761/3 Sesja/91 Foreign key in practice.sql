-- klucz obcy u¿ywa klucza podstawowego lub unikalnych wartoœci do poszukiwania wartoœci
-- klucz obcy ³¹czy ze sob¹ tabele

-- klucz podstawoyw PRIMARY KEY
-- klucz unikalny UNIQUE


select count(EmployeeNumber) from tblEmployee
group by EmployeeNumber
having count(EmployeeNumber)  > 1 


-- nie mo¿emy dodaæ klucz obcy bo jest ogranczenie unique w tabeli
alter table tblTransaction
add constraint FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
REFERENCES tblEmployee(EmployeeNumber)

alter table tblTransaction with nocheck
add constraint FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
REFERENCES tblEmployee(EmployeeNumber)

alter table tblTransaction
drop constraint FK_tblTransaction_EmployeeNumber

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where e.EmployeeNumber = 124

alter table tblTransaction
drop constraint DF_tblTransaction_EmployeeNumber

---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on update cascade -- to zpodwodujê ¿e mo¿na robiæ update na kluczu obcym i zmieni we wszystkich tabelach

update tblEmployee set EmployeeNumber = 9123 Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran

---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on update set null -- to zpodwodujê ¿e mo¿na robiæ update na kluczu obcym ale zmeni na nul we wszystkich tabelach

update tblEmployee set EmployeeNumber = 9123 Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran


---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on update set default -- to zpodwodujê ¿e mo¿na robiæ update na kluczu obcym ale zmeni na default we wszystkich tabelach

update tblEmployee set EmployeeNumber = 9123 Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran


---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on delete no action -- domyœlnie jest no action

delete tblEmployee Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran


---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on delete cascade -- usuwa we wszystkich tabelach

delete tblEmployee Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran

---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on delete set null -- linije nie s¹ usuwane ale numer pracownika ustawia siê na null we wszystkich tableach powi¹zanych

delete tblEmployee Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran



---
begin tran
alter table tblTransaction alter column EmployeeNumber INT NULL
alter table tblTransaction add Constraint DF_tblTransaction_EmployeeNumber default 124 for EmployeeNumber
alter table tblTransaction with nocheck
add constraint FK_tblTranasaction_EmployeeNumber Foreign KEY (EmployeeNumber)
References tblEmployee(EmployeeNumber)
on delete set default -- linije nie s¹ usuwane ale numer pracownika ustawia siê na default

delete tblEmployee Where EmployeeNumber = 123

select e.EmployeeNumber, t.*
from tblEmployee as e
right join tblTransaction as t
ON e.employeeNumber = t.EmployeeNumber
where t.Amount in (-179.47, 786.22, -967.36, 957.03)
rollback tran