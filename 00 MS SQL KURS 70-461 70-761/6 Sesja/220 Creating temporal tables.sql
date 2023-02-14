-- tworzymy zwyk³¹ tabele
CREATE TABLE dbo.tblEmployeeTemporal	(
	EmployeeNumber int NOT NULL ,
	EmployeeFirstName varchar(50) NOT NULL,
	EmployeeMiddleName varchar(50) NULL,
	EmployeeLastName varchar(50) NOT NULL,
	EmployeeGovernmentID char(10) NOT NULL,
	DateOfBirth date NOT NULL, 
	Department varchar(19) NULL
	)


INSERT INTO dbo.tblEmployeeTemporal
	( EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
    , EmployeeGovernmentID, DateOfBirth, Department)
VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
	(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
	(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
	(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
	(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
	(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')

select * from dbo.tblEmployeeTemporal

update dbo.tblEmployeeTemporal set EmployeeLastName = 'Smith' where EmployeeNumber = 124
update dbo.tblEmployeeTemporal set EmployeeLastName = 'Albert' where EmployeeNumber = 124


DROP TABLE dbo.tblEmployeeTemporal
go




-- tworzymy tabele historyczn¹
CREATE TABLE dbo.tblEmployeeTemporal	(
	EmployeeNumber int NOT NULL  PRIMARY KEY CLUSTERED , -- musimy dodaæ klucz podstawowy
	EmployeeFirstName varchar(50) NOT NULL,
	EmployeeMiddleName varchar(50) NULL,
	EmployeeLastName varchar(50) NOT NULL,
	EmployeeGovernmentID char(10) NOT NULL,
	DateOfBirth date NOT NULL, 
	Department varchar(19) NULL
	, ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START -- trzy kolumny do tabeli historycznej
	, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END -- trzy kolumny do tabeli historycznej
	, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo ) -- trzy kolumny do tabeli historycznej
	)
	WITH (SYSTEM_VERSIONING = ON ) --(HISTORY_TABLE = dbo.tblEmployeeHistory))



INSERT INTO dbo.tblEmployeeTemporal
	( EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
    , EmployeeGovernmentID, DateOfBirth, Department)
VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
	(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
	(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
	(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
	(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
	(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')

select * from dbo.tblEmployeeTemporal

update dbo.tblEmployeeTemporal set EmployeeLastName = 'Smith' where EmployeeNumber = 124
update dbo.tblEmployeeTemporal set EmployeeLastName = 'Albert' where EmployeeNumber = 124

select * from dbo.tblEmployeeTemporal