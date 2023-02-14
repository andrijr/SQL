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

select IDtblGeom
, GXY.STGeometryType() as MyType
, GXY.STStartPoint().ToString() as StringPoint
, GXY.STEndPoint().ToString() as EndingPoint
, GXY.STPointN(1).ToString() as FirstPoint
, GXY.STPointN(2).ToString() as SecondPoint
, GXY.STPointN(1).STX as FirstPointX
, GXY.STPointN(1).STY as FirstPointY
, GXY.STNumPoints() as NumberPoints
from tblGeom


declare @g as geometry
declare @h as geometry

select @g = GXY from tblGeom where IDtblGeom = 1 
select @g = GXY from tblGeom where IDtblGeom = 3
select @g.STDistance(@h) as MyDistance


select @g, 'Point 1'
union all
select @h, 'Point 2'

rollback tran