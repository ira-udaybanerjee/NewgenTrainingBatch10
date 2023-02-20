/* 
Classification of SQL Statements:

DML (Data Manipulation/Modification Language) - Insert, Update, Delete, Truncate

DQL (Data Query Language) - Select

DDL (Data Definition Language) works on structural level - Create, Alter 

DCL (Data Control Language) works on permissions - Grant, Revoke, Deny
*/



--Normalized Tables


create table Customer
(
CustomerId int primary key, --Primary key is a type of constraint (maintain entity integrity)
CustomerName varchar(50) not null,
[Address] varchar(100),
City varchar(200),
MobileNo varchar(10)
)



--The integrity maintained by primary key is known as Entity Integrity

create table Salesperson
(
SalespersonId int primary key,
SalespersonName varchar(50) not null,
DateOfJoining date not null,
TeamLeaderCode int
)


select * from Salesperson 

--Check maintains domain integrity
--money, smallmoney

create table Product
(
ProductId int primary key,
ProductName varchar(50) not null,
StdPrice smallmoney check (StdPrice > 0) not null,
OpeningStock numeric(10,2) check (OpeningStock >= 0) not null
)


select * from Salesperson 

select * from product 

--One to Many Relationship between Customer and Orders
--One to Many Relationship between Salesperson and Orders

create table Orders
(
OrderId int identity primary key,
OrderDateTime datetime not null,
--Customer Id is a foreign key in this table
--Foreign key is used to establish a relationship between two tables
--Foreign key maintains referential integrity
CustomerId int references Customer(CustomerId) not null, --foreign key in orders table --primary key in customer table
SalespersonId int references Salesperson(SalespersonId) not null --foreign key in orders --primary key in salesperson table
)


SELECT * FROM Orders 

insert into Orders
values ('2022-07-01', 2, 4)





select * from Customer 


create table OrderDetails
(
OrderId int references Orders(OrderId),
ProductId int references Product(ProductId),
QtySold numeric(10,2) not null check (QtySold > 0),
SalePrice smallmoney not null check (SalePrice > 0)
)

select * from OrderDetails 



insert into Customer 
values (1,'Uday','Court Road','Saharanpur','9634262077')

insert into Customer 
values (2,'Dharmesh','GMS Road','Dehradun','9696969696')

insert into Customer
values (3,'Sanjeev', 'Roorkee Road', 'Meerut', '9797979797')





insert into Salesperson 
values (1, 'Rajesh', '2018-11-01',null)

insert into Salesperson
values (2, 'Rakesh', '2019-01-01', 1)

insert into Salesperson
values (3, 'Manu', '2019-01-15',1)

insert into Salesperson
values (4, 'Apurv','2019-02-01',2)





insert into Product
values (1, 'Vivo', 18000, 10)

insert into Product
values (2, 'Oppo', 17000, 10)

insert into Product
values (3, 'Apple', 80000, 10)

insert into Product
values (4, 'Realme', 16000, 10)


insert into Orders
values ('2020-08-05', 2, 1)

insert into OrderDetails
values (1, 2, 2, 16600), (1, 1, 4, 17000)

insert into Orders
values ('2020-09-01', 1, 3)

insert into OrderDetails
values (2, 3, 1, 80000)

insert into Orders
values ('2020-09-30', 3, 2)

insert into OrderDetails
values (4, 1, 2, 17300), (4, 2, 1, 17000), (4, 3, 2, 15500)





--OrderId, OrderDateTime, CustomerName, SalespersonName

select OrderId, OrderDateTime, CustomerName, MobileNo, SalespersonName
from Orders join Customer on Orders.CustomerId = Customer.CustomerId
join Salesperson on Orders.SalespersonId = Salesperson.SalespersonId 

select * from Orders 
select * from Customer
select * from Salesperson 

select * from orderdetails 


--orderid, productname, qtysold, saleprice


select o.orderid, orderdatetime, productname, qtysold, saleprice
from orderdetails od join Product p on od.ProductId = p.ProductId 
join orders o on od.OrderId = o.OrderId 



--orderid, orderdatetime, customername, mobileno,
--productname, qtysold, stdprice, salespersonname



CREATE TABLE Person
(
PersonNo int,
PersonName varchar(50),
ResiAddress varchar(200)
)

INSERT Person
VALUES(1, 'Uday', 'Saharanpur')

INSERT Person
VALUES(1, 'Ajay', 'Dehradun')

INSERT Person
VALUES(2, 'Priti', 'Meerut')



SELECT * FROM Person 


ALTER TABLE Person
ADD CONSTRAINT pk_PersonId PRIMARY KEY (PersonNo)


ALTER TABLE Person
ALTER COLUMN PersonNo int NOT NULL

UPDATE Person
SET PersonNo = 3
WHERE PersonName = 'Priti' AND ResiAddress = 'Meerut'


SELECT * FROM Person 

CREATE TABLE QualMasters
(
QualCode int primary key,
Details varchar(20) not null
)


INSERT QualMasters 
VALUES 
(1, 'M.Com'),(2,'M.Sc.(IT)'),(3,'LLB'),(4,'PhD'),(5,'H.Sec')

SELECT * FROM QualMasters 

CREATE TABLE PersonQual
(
PersonNo int references Person(PersonNo) not null, --Foreign Key
QualCode int references QualMasters(QualCode) not null, --Foreign Key
Remarks varchar(100)
)

SELECT * FROM PersonQual 

ALTER TABLE PersonQual
ADD CONSTRAINT unq_PersonQual UNIQUE (PersonNo, QualCode)

INSERT PersonQual 
VALUES (1,4,'OK')


alter table person
add Remarks varchar(20)


--JOINS

SELECT * FROM PersonQual 

SELECT p.PersonNo, PersonName, Details, pq.Remarks
FROM PersonQual pq JOIN Person p
ON pq.PersonNo = p.PersonNo 
JOIN QualMasters qm
ON qm.QualCode = pq.QualCode 


SELECT * FROM Person 

SELECT * FROM PersonQual 


--OUTER JOIN

SELECT p.PersonNo, PersonName, Details
FROM Person p FULL JOIN PersonQual pq
ON pq.PersonNo = p.PersonNo 
FULL JOIN QualMasters qm
ON pq.QualCode = qm.QualCode 


SELECT * FROM Salesperson

--SalespersonId, SalespersonName, DateOfJoining, TLName




SELECT S2.SalespersonId, S2.SalespersonName, S2.DateOfJoining,
S1.SalespersonName as [Team Leader Name]
FROM Salesperson S1 RIGHT JOIN Salesperson S2
ON S2.TeamLeaderCode = S1.SalespersonId 





SELECT p.PersonNo, PersonName, Details
FROM Person p FULL JOIN PersonQual pq
ON pq.PersonNo = p.PersonNo 
FULL JOIN QualMasters qm
ON pq.QualCode = qm.QualCode 





SELECT BookId, BookName, Price, AuthorName INTO Book_Author_Copy
FROM Books

SELECT * FROM Book_Author_Copy



SELECT p.PersonNo, PersonName, Details INTO Person_Qual_Details
FROM Person p FULL JOIN PersonQual pq
ON pq.PersonNo = p.PersonNo 
FULL JOIN QualMasters qm
ON pq.QualCode = qm.QualCode 

CREATE VIEW vw_Leader_Team
AS
SELECT S2.SalespersonId, S2.SalespersonName, S2.DateOfJoining,
S1.SalespersonName as [Team Leader Name]
FROM Salesperson S1 RIGHT JOIN Salesperson S2
ON S2.TeamLeaderCode = S1.SalespersonId 



ALTER PROCEDURE prc_Leader_Team @TeamLeaderName varchar(50)='Ashmit', @Year int = 2019
AS
SELECT * FROM vw_Leader_Team 
WHERE [Team Leader Name]  = @TeamLeaderName AND YEAR(DateOfJoining) = @Year 



EXEC prc_Leader_Team