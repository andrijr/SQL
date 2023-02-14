 
 SET SHOWPLAN_ALL ON -- ustawia wyniki testu wydajnoœci w formie tabeli zamiast graficznej
 go


 select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left loop join tblEmployee as e -- merge teraz bêdziemy miêæ po³¹czenie merge w testach wydajnoœci
on d.Department = e.Department   
where d.Department = 'HR'


 SET SHOWPLAN_ALL OFF
 go


  SET SHOWPLAN_XML ON -- ustawia wyniki testu wydajnoœci w formie tabeli zamiast graficznej
 go

   SET SHOWPLAN_XML OFF -- ustawia wyniki testu wydajnoœci w formie tabeli zamiast graficznej
 go

  SET SHOWPLAN_TEXT ON -- ustawia wyniki testu wydajnoœci w formie tabeli zamiast graficznej
 go

   SET SHOWPLAN_TEXT OFF -- ustawia wyniki testu wydajnoœci w formie tabeli zamiast graficznej
 go


 SET STATISTICS TIME ON
 Go

  SET STATISTICS TIME OFF
 Go


  SET STATISTICS IO ON
 Go

  SET STATISTICS IO OFF
 Go

  select d.Department, d.DepartmentHead, e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
from tblDepartment as d
left loop join tblEmployee as e -- merge teraz bêdziemy miêæ po³¹czenie merge w testach wydajnoœci
on d.Department = e.Department   
where d.Department = 'HR'