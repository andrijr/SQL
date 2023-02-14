USE [70-461];

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

-- Mo¿emy dodaæ ; œrednik na koñcu ale nie jest to konieczne w tym przypadku
-- Mo¿emy dodac GO po zapytaniu


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) *
  FROM tblFirst


select top(2) *
from tblSecond