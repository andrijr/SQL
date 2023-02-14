Begin tran
create table tblGeom 
( GXY geometry,
Description varchar(30),
IDtblGeom int Constraint PK_tblGeom Primary Key identity(1,1) )

insert into tblGeom (GXY, Description)
values (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First Lain'),
	   (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second Lain'),
	   (geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5) )', 0), 'Second Lain'),
	   (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1) )', 0), 'Polygon'),
	   (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0 )', 0), 'Cirkle'),
	   	(geometry::STGeomFromText('LINESTRING (2 0, 0 2, -2 0, 0 -2, 2 0 )', 0), 'Kwadrat')


select GXY, Description from tblGeom order by IDtblGeom
select GXY, Description from tblGeom order by IDtblGeom DESC

rollback tran
