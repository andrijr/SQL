Begin tran
create table tblGeog
( GXY geography,
Description varchar(30),
IDtblGeog int Constraint PK_tblGeog Primary Key identity(1,1) )

insert into tblGeog (GXY, Description)
values (geography::STGeomFromText('Point (-73.993492 40.750525)', 4326), 'Madison Square Gardens, NY'),
	   (geography::STGeomFromText('Point (-0.177452 51.500905)', 4326), 'Royal Albert Hall, London'),
	   (geography::STGeomFromText('LINESTRING (-73.993492 40.750525, -0.177452 51.500905 )', 4326), 'Conection')


select * from tblGeog

declare @g as geography
select @g = GXY 
from tblGeog where IDtblGeog = 1

select IDtblGeog
, GXY.STGeometryType() as MyType
, GXY.STStartPoint().ToString() as StringPoint
, GXY.STEndPoint().ToString() as EndingPoint
, GXY.STPointN(1).ToString() as FirstPoint
, GXY.STPointN(2).ToString() as SecondPoint
--, GXY.STPointN(1).STX as FirstPointX
--, GXY.STPointN(1).STY as FirstPointY
--, GXY.STBoundary().ToString()  as Boundary
, GXY.STLength() as MyLength
, GXY.STIntersection(@g).ToString() as Intersection
, GXY.STNumPoints() as NumberPoints
, GXY.STDistance(@g) as DistanceFromFirstLine
from tblGeog


declare @h as geography
select @g = GXY from tblGeog where IDtblGeog = 1
select @h = GXY from tblGeog where IDtblGeog = 2

select GXY.STUnion(@g) from tblGeog where IDtblGeog = 2

--select * from sys.spatial_reference_systems

rollback tran
