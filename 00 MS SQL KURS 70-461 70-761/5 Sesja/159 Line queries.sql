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




select IDtblGeom
, GXY.STGeometryType() as MyType
, GXY.STStartPoint().ToString() as StringPoint
, GXY.STEndPoint().ToString() as EndingPoint
, GXY.STPointN(1).ToString() as FirstPoint
, GXY.STPointN(2).ToString() as SecondPoint
, GXY.STPointN(1).STX as FirstPointX
, GXY.STPointN(1).STY as FirstPointY
, GXY.STBoundary().ToString()  as Boundary
, GXY.STLength() as MyLength
, GXY.STNumPoints() as NumberPoints
from tblGeom


declare @g as geometry

select @g = GXY 
from tblGeom where IDtblGeom = 5

select IDtblGeom, GXY.STIntersection(@g).ToString() as Intersection,  GXY.STDistance(@g) as DistanceFromFirstLine
from tblGeom 

select GXY.STUnion(@g) 
from tblGeom where IDtblGeom = 8





select GXY, Description from tblGeom order by IDtblGeom
select GXY, Description from tblGeom order by IDtblGeom DESC

rollback tran


