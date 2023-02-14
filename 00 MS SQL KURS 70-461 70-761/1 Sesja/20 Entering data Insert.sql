USE [70-461]
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

GO

--BULK INSERT 
--FROM 'C:\insert.csv'
--WITH
--(
--FIELDTERMINATOR = ',',
--ROWTERMINATOR = '\n'
--)
--GO


select * from tblFirst