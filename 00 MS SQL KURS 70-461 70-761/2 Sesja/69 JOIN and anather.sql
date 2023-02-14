USE [70-461]
GO

drop table tblFirst
drop table tblSecond

CREATE TABLE tblFirst
(myNumber int,
 myName varchar(50));
GO

CREATE TABLE tblSecond
(myNumber int,
 myName varchar(50));
GO

truncate table tblFirst
truncate table tblSecond

INSERT INTO tblFirst 
(myNumber, myName)
VALUES
(1, 'AA'),
(2, 'BB'),
(2, 'BB2'),
(4, 'DD');

INSERT INTO tblSecond 
(myNumber, myName)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(5, 'D');

GO

select * from tblFirst
select * from tblSecond

-----------------------------------

select * from tblFirst A
INNER JOIN tblSecond B
ON A.myNumber = B.myNumber

select * from tblFirst A
LEFT JOIN tblSecond B
ON A.myNumber = B.myNumber

select * from tblFirst A
RIGHT JOIN tblSecond B
ON A.myNumber = B.myNumber

select * from tblFirst A
FULL JOIN tblSecond B
ON A.myNumber = B.myNumber

-----------------


select * from tblFirst A
LEFT JOIN tblSecond B
ON A.myNumber = B.myNumber
where b.myNumber is null


select * from tblFirst A
RIGHT JOIN tblSecond B
ON A.myNumber = B.myNumber
where a.myNumber is null


select * from tblFirst A
FULL JOIN tblSecond B
ON A.myNumber = B.myNumber
where a.myNumber is null OR b.myNumber is null


select * from tblFirst A
cross JOIN tblSecond B
