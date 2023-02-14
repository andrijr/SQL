use [70-461S7]

SELECT EmployeeNumber
      ,EmployeeFirstName
      ,EmployeeMiddleName
      ,EmployeeLastName
      ,EmployeeGovernmentID
      ,DateOfBirth
      ,Department
  FROM tblEmployee


  SELECT Department , DepartmentHead
  FROM tblDepartment

  SELECT Amount
      ,DateOfTransaction
      ,EmployeeNumber
  FROM tblTransaction