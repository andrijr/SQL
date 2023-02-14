
select * from dbo.tblEmployeeTemporal

select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME AS OF '2021-01-01'


select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME 
from '2020-01-01' to '2023-01-01' -- zawiera danie bierz¹ce i historyczne oraz zwraca end date trochy inaczej jak between
where EmployeeNumber = 124

select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME 
between '2020-01-01' and '2023-01-01' -- zawiera danie bierz¹ce i historyczne
where EmployeeNumber = 124


select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME 
contained in   ( '2020-01-01' , '2023-01-01' ) -- zwraca tylko historyczne dane bez bierz¹cych
where EmployeeNumber = 124



-- usuwamy w poni¿szy sposób mo¿emy podej¿yæ w sql server ten kod
ALTER TABLE dbo.tblEmployeeTemporal SET ( SYSTEM_VERSIONING = OFF  )
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.tblEmployeeTemporal') AND type in (N'U'))
DROP TABLE dbo.tblEmployeeTemporal
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.MSSQL_TemporalHistoryFor_519672899') AND type in (N'U'))
DROP TABLE dbo.MSSQL_TemporalHistoryFor_519672899
GO


-- tworzymy tabele historyczn¹
CREATE TABLE dbo.tblEmployeeTemporal	(
	EmployeeNumber int NOT NULL  PRIMARY KEY CLUSTERED , -- musimy dodaæ klucz podstawowy
	EmployeeFirstName varchar(50) NOT NULL,
	EmployeeMiddleName varchar(50) NULL,
	EmployeeLastName varchar(50) NOT NULL,
	EmployeeGovernmentID char(10) NOT NULL,
	DateOfBirth date NOT NULL, 
	Department varchar(19) NULL
	, ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START  HIDDEN -- ukrywa kolumny
	, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END HIDDEN -- ukrywa kolumny
	, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo )
	)
	WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory ) ) -- dajemy nazwe tabeli historycznej

select * from dbo.tblEmployeeTemporal


INSERT INTO dbo.tblEmployeeTemporal
	( EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
    , EmployeeGovernmentID, DateOfBirth, Department)
VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
	(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
	(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
	(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
	(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
	(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')


update dbo.tblEmployeeTemporal set EmployeeLastName = 'Smith' where EmployeeNumber = 124
update dbo.tblEmployeeTemporal set EmployeeLastName = 'Albert' where EmployeeNumber = 124

select * from dbo.tblEmployeeTemporal

select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME AS OF '2021-01-01'	