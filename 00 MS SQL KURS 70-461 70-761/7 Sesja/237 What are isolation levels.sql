begin tran
select *  from tblEmployee
commit tran

-- Transaction isolation levels

-- 1 Read Commited
-- 2 Read UnCommited
-- 3 Repeatable Read
-- 4 Snapshot
-- 5 Serializable
