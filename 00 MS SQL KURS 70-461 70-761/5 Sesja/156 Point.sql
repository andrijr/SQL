Begin tran
create table tblGeom 
( GXY geometry,
Description varchar(30),
IDtblGeom int Constraint PK_tblGeom Primary Key identity(1,1) )

insert into tblGeom (GXY, Description)
values (geometry::STGeomFromText('POINT (3 4)', 0), 'First Point'),
	   (geometry::STGeomFromText('POINT (3 5)', 0), 'Second Point'),
	   (geometry::Point(4, 6, 0), 'Third Point'),
	   (geometry::STGeomFromText('MULTIPOINT ( (1 2) , (2 3) , (3 4) )', 0),  'Three Point')


select GXY, Description from tblGeom

rollback tran