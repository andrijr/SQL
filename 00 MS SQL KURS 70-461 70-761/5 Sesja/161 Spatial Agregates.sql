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
	   (geometry::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2) )', 0), 'Second Polygon'),
	   (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0 )', 0), 'Cirkle'),
	   	(geometry::STGeomFromText('LINESTRING (2 0, 0 2, -2 0, 0 -2, 2 0 )', 0), 'Kwadrat')



select * from tblGeom

select *, GXY.Filter(geometry::Parse('Polygon((2 1, 1 4, 4 4 ,4 1, 2 1))'))  from tblGeom
union all
select geometry::STGeomFromText('Polygon((2 1, 1 4, 4 4 ,4 1, 2 1))', 0), 'Filter', 0, 0  from tblGeom

select * from tblGeom
where GXY.Filter(geometry::Parse('Polygon((2 1, 1 4, 4 4 ,4 1, 2 1))')) = 1

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


declare @i as geometry
select @i = geometry::UnionAggregate(GXY)
from tblGeom 
select @i as CombinedShapes


declare @j as geometry
select @j = geometry::CollectionAggregate(GXY)
from tblGeom 
select @j as CombinedShapes


select @i as CombineShape
union all
select geometry::EnvelopeAggregate(GXY).ToString() as Envelope from tblGeom
union all
select geometry::ConvexHullAggregate(GXY).ToString() as Envelope from tblGeom



select @i as CombineShape
--union all
select geometry::EnvelopeAggregate(GXY).ToString() as Envelope from tblGeom
--union all
select geometry::ConvexHullAggregate(GXY).ToString() as Envelope from tblGeom







rollback tran
