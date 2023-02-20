select * from books 


--Data in a table in divided into pages of 8 KB each

CREATE TABLE HeapTable
(
HeapId int,
HeapName varchar(50),
HeapDate date
)


INSERT INTO HeapTable 
VALUES (8, 'Heap 8', getdate()-1)

INSERT INTO HeapTable 
VALUES (3, 'Heap 3', getdate()+2)

INSERT INTO HeapTable 
VALUES (7, 'Heap 7', getdate())

INSERT INTO HeapTable 
VALUES (2, 'Heap 2', getdate()-7)

select * from HeapTable 

--creation of primary key after creating table

alter table HeapTable
alter column HeapId int not null

alter table HeapTable
add constraint pk_HeapId primary key (HeapId)

--creation of primary key creates
--a CLUSTERED INDEX on the column
--which physically sorts the data inside
--the table

select * from HeapTable 

insert into HeapTable
values (1, 'Heap 1', getdate() + 6)


insert into HeapTable 
values (4, 'Heap 4', getdate()-100)

select HeapId, HeapDate from HeapTable 
where HeapDate = getdate()





CREATE TABLE HeapTable2
(
HeapId int,
HeapName varchar(50),
HeapDate date
)

insert into HeapTable2 
values (3, 'Heap 3', getdate()-3)

insert into HeapTable2 
values (1, 'Heap 1', getdate())

--will scan
select HeapId, HeapName, HeapDate
from HeapTable2 
where HeapId = 3

--will seek
select HeapId, HeapName, HeapDate
from HeapTable
where HeapId = 3


select HeapId, HeapDate, HeapName
from HeapTable
where HeapDate = '2021-12-01'

select * from HeapTable 

--CREATE A NONCLUSTERED INDEX
CREATE NONCLUSTERED INDEX idx_HeapDate
ON HeapTable(HeapDate)
INCLUDE (HeapName)
--NCL Index with contain the following columns
--HeapId, HeapDate

select heapid, HeapName, heapdate from HeapTable 
where heapdate = getdate()



--DROP AN INDEX
DROP INDEX idx_HeapDate
ON HeapTable



select HeapId, HeapDate, HeapName
from HeapTable
where HeapName = 'Heap 11'


CREATE NONCLUSTERED INDEX idx_HeapName
ON HeapTable(HeapName)
INCLUDE (HeapDate)


CREATE TABLE IndTable
(
IndId int primary key nonclustered,
IndName varchar(200),
IndDate date
)

insert into IndTable 
values (5,'Ind 5',getdate()-5)

select * from IndTable

CREATE CLUSTERED INDEX idx_IndId
ON IndTable(IndDate) 


select * from Customer 

select customerid, customername
from Customer where City = 'Dehradun'

CREATE NONCLUSTERED INDEX idx_City
ON Customer(City)
INCLUDE (CustomerName, MobileNo)


select customerid, customername
from Customer where MobileNo = '9634963411'

CREATE NONCLUSTERED INDEX idx_Mobile
ON Customer(MobileNo)
INCLUDE (CustomerName, City)