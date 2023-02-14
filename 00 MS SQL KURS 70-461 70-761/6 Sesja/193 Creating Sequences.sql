-- alternatywa dla    NEWSEQUENTIALID()
-- sekwencje

Begin tran
Create SEQUENCE newSeq as bigint -- int
Start WITH 1
INCREMENT By 1
MINVALUE 1
MAXVALUE 999999
CYCLE
Create SEQUENCE secondSeq as int
select * from sys.sequences
rollback tran
