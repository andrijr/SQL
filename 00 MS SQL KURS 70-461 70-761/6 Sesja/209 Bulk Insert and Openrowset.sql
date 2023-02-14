-- pierwszy sposób
drop table #tblXML
go
create table #tblXML(XmlCol xml)
go

--select * from #tblXML
bulk insert #tblXML from 'D:\_XML\209_SampleDataBulkInsert.txt'
select * from #tblXML

 

-- drógi sposób
drop table #tblXML
go
create table #tblXML(IntCol int, XmlCol xml)
go
insert into #tblXML(XmlCol)
select * from
openrowset ( BULK  'D:\_XML\209_SampleDataOpenRowset.txt', SINGLE_BLOB ) as x
select * from #tblXML