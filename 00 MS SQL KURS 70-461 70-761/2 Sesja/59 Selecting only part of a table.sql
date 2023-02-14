select * from tblEmployee
where EmployeeNumber > 200

select * from tblEmployee
where not EmployeeNumber > 200

select * from tblEmployee
where not EmployeeNumber = 200

select * from tblEmployee
where  EmployeeNumber != 200

 select * from tblEmployee
where  EmployeeNumber >= 200 and EmployeeNumber <= 210

 select * from tblEmployee
where not ( EmployeeNumber >= 200 and EmployeeNumber <= 210)

 select * from tblEmployee
where  ( EmployeeNumber < 200 or EmployeeNumber > 210)

 select * from tblEmployee
where  EmployeeNumber between 200 and 210

 select * from tblEmployee
where not EmployeeNumber between 200 and 210

 select * from tblEmployee
where  EmployeeNumber in ( 200 , 210)