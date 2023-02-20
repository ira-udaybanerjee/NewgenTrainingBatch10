
-- Script For Table Creation namely Books Table--
-- char(fixed size)

-- varchar(variable size)

-- int -2^31 to +2^31-1 4 bytes

-- smallint -2^15 (-32768) to +2^15-1 (32767) 2 bytes

-- bigint -2^63 to 2^63-1 8 bytes

-- tinyint 0 to 255 1 byte

-- numeric (10,2) 78653425.80
-- decimal

--float
--double

Create Table Books
(
BookId char(5) Primary Key, -- check(BookId Like 'B[0-9][0-9][0-9][0-9]'),
BookName varchar(40) Not Null, 
AuthorName varchar(40), 
Price SmallInt check(Price >0),
Publish_Date smallDateTime, 
Publisher_Name varchar(40) Not Null,
category varchar(25) , 
BookLanguage varchar(20)
)





--Scirpt For Inserting Records in Books Table --

Insert Into Books values('B1100','Idols','S.M. GavasKar',450,'8-May-87','Rupa','Auto Biography','English')
Insert Into Books values('B1145','Three Masketiers','Alexander Duma',290,'18-June-1957','Ananda Publishers','Novel','English')
Insert Into Books values('B1290','Learning C ','E. Balaguruswamy',290,'10-Oct-1995','Tata McgrawHills','Programming Language','English')
Insert Into Books values('B1293','Rishtey ','Sandeep Ahlawat',610,'25-Oct-2009','Tata McgrawHills','Novel','Hindi')
Insert Into Books values('B2543','Ancient Times ','Amrit Puri',450,'25-Oct-2013','BPB','Novel','Hindi')
Insert Into Books values('B2521','Bay of Bengal','Anjali Saha',390,'25-Jan-2016','BPB','Novel','Bengali')
Insert Into Books values('B1420','Indian Politics','Jaswant Sinha',540,'4-Apr-2012','Ananda Publishers','Story Book','Hindi')
Insert Into Books values('B1497','This & That','Chetan Bhagat',540,'14-Apr-2012','Rupa','Story Book','English')
Insert Into Books values('B1422','The Emergency','K. Nair',670,'9-Aug-2002','Rupa','Story Book','English')
Insert Into Books values('B1424','The Tall Man','E. Bhargava',790,'16-Nov-2016','BPB','Story Book','Marathi')
Insert Into Books values('B1419','Punjabi Rasoi','Khushwant Singh',670,'9-Aug-2002','Tata McgrawHills','Biography','Punjabi')
Insert Into Books values('B1361','College Days','Seema Avasthi',620,'12-Sep-2010','Tata McgrawHills','Story Book','Marathi')
Insert Into Books values('B1365','Sanket','asheem Dey',920,'12-Sep-2019','Ananda Publishers','Literature','Bengali')
Insert Into Books values('B1366','Paar',NULL,285,'12-Feb-2007','Rupa','Auto Biography','Assamese')

--Rename database
sp_renamedb 'Library', 'LibraryDb'

--Retrieve all records

select * from Books 

--Retrieve data with selected columns

SELECT BookId, BookName, AuthorName, Price From Books


--Customizing column names (Method 1) Column Alias
Select 'Name of Book'=BookName , 'Date of Publishing'=publish_date
From Books

--Customizing column names (Method 2) Column Alias
SELECT BookName AS 'Name of Book', publish_date AS 'Date  of Publishing' FROM Books

--Customizing column names (Method 3) Column Alias
SELECT BookName [Name of Book], publish_date [Date  of Publishing] FROM Books


--Adding calculated columns to output
Select BookName , Price , 'Commision'= Price*.1 From Books



--Retrieve selected rows from table (Restriction)
Select * From Books where Publisher_Name='BPB'

--Comparison Operator
Select * From Books where Price >=500

Select * From Books WHERE Publisher_Name <> 'Rupa'

--Using AND Operator
Select * From Books where Price >=500 and publisher_Name='BPB'

--Using OR Operator
SELECT * FROM Books
WHERE Publisher_Name = 'Rupa' OR Publisher_Name='BPB' 

SELECT * FROM Books
WHERE Publisher_Name = 'Rupa' OR AuthorName = 'E. Bhargava' 

--Using IN
SELECT * FROM Books Where Publisher_Name IN ('Rupa','BPB') 

--Using NOT IN
SELECT * FROM Books Where Publisher_Name NOT IN ('Rupa','BPB') 


--Using BETWEEN
SELECT * FROM Books WHERE Price BETWEEN 200 AND 300

--USING NOT BETWEEN 
SELECT * FROM Books WHERE Price NOT BETWEEN 300 AND 500 



--USING LIKE
SELECT * FROM Books WHERE Publisher_Name LIKE 'Tata%'

SELECT * FROM Books
WHERE Category LIKE '%Story%'

SELECT * FROM Books
WHERE BookName LIKE 'T%'


--RETRIEVE ROWS WITH NULL VALUES
SELECT * FROM Books WHERE AuthorName IS NULL 

--NOT NULL
SELECT * FROM Books WHERE AuthorName IS NOT NULL





--ORDER BY
SELECT BookId, BookName, AuthorName, Price
FROM Books
ORDER BY AuthorName 


--TOP KEYWORD
SELECT TOP 3 BookId, BookName, AuthorName, Price
FROM Books 
ORDER BY Price desc




--OFFSET FETCH
SELECT BookId, BookName, AuthorName, Price
FROM Books
ORDER BY AuthorName
OFFSET 5 ROWS
FETCH NEXT 3 ROWS ONLY


--OFFSET FETCH
SELECT BookId, BookName, AuthorName, Price
FROM Books
ORDER BY Price DESC
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY



SELECT Category FROM Books 


--DISTINCT KEYWORD
SELECT DISTINCT Category 
FROM Books 

SELECT DISTINCT Publisher_Name
FROM Books 

SELECT DISTINCT Publisher_Name, category
FROM Books 


--AGGREGATE FUNCTIONS
SELECT SUM(Price) as [Total Price] FROM Books 

SELECT AVG(Price) as [Avg Price] FROM Books

SELECT MAX(Price) as [Max Price] FROM Books 

SELECT MIN(Price) as [Min Price] FROM Books 

SELECT MIN(Publish_Date) as [Oldest Book] FROM Books 

SELECT MAX(Publish_Date) as [Newest Book] FROM Books 



SELECT COUNT(DISTINCT Publisher_Name) as [Unique Publisher Names] from Books 


SELECT COUNT(AuthorName) as [No of Authors] FROM Books 

SELECT COUNT(DISTINCT AuthorName) as [Unique No of Authors] From Books 


--String Functions



--LEFT Function
SELECT BookId, BookName, AuthorName, LEFT(BookLanguage, 3) as [Language]
FROM Books 


--LEN Function
SELECT BookId, BookName, LEN(BookName) as [Length],
AuthorName, Price
FROM Books 
WHERE LEN(BookName) > 10 
ORDER BY LEN(BookName) DESC



--LTRIM Function
SELECT BookId, LTRIM(BookName), RTRIM(AuthorName), TRIM(Category)
FROM Books 

--REVERSE Function
SELECT BookId, REVERSE(BookName) as [Reverse Name] FROM Books 

--NESTED Function
SELECT BookId, BookName, AuthorName, UPPER(BookLanguage)
FROM Books 

SELECT BookId, BookName, AuthorName, REVERSE(UPPER(LEFT(BookLanguage,3)))
FROM Books 



--CONCAT FUNCTION
SELECT BookId, CONCAT(BookName, SPACE(1), 'By', SPACE(1), AuthorName)
FROM Books 

--NESTED CONCAT FUNCTION
SELECT BookId, CONCAT(BookName,SPACE(1),'By',SPACE(1),ISNULL(AuthorName, 'None'))
FROM Books 


SELECT * FROM Books 

--BookId,
-- Idols, a Autobiography from Rupa By S.M. Gavaskar
-- Three Masketiers a Novel from Ananda Publishers By Alexander Duma
--Price


--IS NULL FUNCTION
SELECT BookId, BookName, ISNULL(AuthorName, 'No Author Record') as [Author's Name], 
Price
FROM Books 


--COALESCE FUNCTION
SELECT COALESCE(NULL, NULL, 'ABC', NULL, 'DEF')


--SUBSTRING FUNCTION
SELECT SUBSTRING(BookName, 2,2) FROM Books 

SELECT SUBSTRING(BookName, 2, LEN(Bookname)) From Books 




--DATE FUNCTIONS
SELECT GETDATE() 

SELECT DATEADD(YY, -3, GETDATE()) 

ALTER view [dbo].[vw_FullOrderDetails]
as
select od.orderid, orderdatetime,
dateadd(yy, 2, OrderDateTime) as WarrantyPeriod,
customername, city,
salespersonname, productname,
qtysold, saleprice, QtySold * SalePrice as Amount
from orderdetails od join orders o on od.OrderId = o.orderid
join product p on od.ProductId = p.ProductId 
join customer c on o.customerid = c.CustomerId 
join salesperson s on o.salespersonid = s.SalespersonId 

SELECT DAY(GETDATE()), MONTH(GETDATE()), YEAR(GETDATE())

SELECT BookId, BookName, AuthorName,
DAY(Publish_Date) as PublishDay, Month(Publish_Date) as PublishMonth, 
YEAR(Publish_Date) as PublishYear
FROM Books


SELECT * FROM Books
WHERE YEAR(Publish_Date) > 2000



SELECT BookId, BookName, AuthorName,
Publish_Date,
DATENAME(dw, Publish_Date) as PublishDay
FROM Books

SELECT * FROM Orders 

--OrderId, OrderDateTime, Weekday





SELECT BookId, BookName, AUthorName,
DATEDIFF(MM, Publish_Date, GETDATE()) as [Book Age]
FROM Books 


select SalespersonId, SalespersonName,
DateOfJoining
from Salesperson 
WHERE DATEDIFF(yy, DateOfJoining, GETDATE()) > 2




--All salespersons working with us for more than 2 years




--Filter Data on Bases of Year Of Publication

SELECT * FROM Books
WHERE YEAR(Publish_Date) > 2000


--Important Numeric Functions
SELECT CEILING(14.1) 

SELECT FLOOR(15.9)

SELECT ROUND(15.4,0)

--e (2.7182818284590451) RAISED TO THE POWER
SELECT EXP(3)

SELECT POWER(9, 2)

--CHOOSE FUNCTION

SELECT BookId, BookName, CHOOSE(2, AuthorName, Publisher_Name, Category, BookLanguage) as [Book Description]
From Books 

--IIF FUNCTION

SELECT BookId, BookName, AuthorName,
Price, IIF(Price >=600, 0.20 * Price, 0.15 * Price) AS Discount
From Books 

SELECT BookId, BookName, AuthorName,
Price, IIF(Price >=600, 0.20, IIF(Price>=450, 0.15, IIF(Price >=300, 0.10, 0))) AS Discount
From Books 

-- Age 5 Years 0, 5-10 0.10, 10-20 0.15 >20 0.20



--CREATE TABLE WITH CONSTRAINTS

Create Table Distributor
(
DistributorCode smallint identity(1,1) Primary Key,
DistributorName varchar(40) Not Null,
ContactNo char(10) check( ContactNo Like '[0- 9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Address varchar(40) Not Null,
Remarks varchar(40),
Date_Estd smalldatetime check(Date_Estd >= ('1-Jan-1950')),
City varchar(30) Not Null,
State varchar(20) Not Null, 
Pin char(7) check (Pin Like '[0-9][0-9][0-9][0-9][0-9][0-9]')
)

Insert Into Distributor 
values
('Neo Book Agency','9634262077','Authorised Distributor','2C/3158 Court Road','1-Dec-1976','Saharanpur','Uttar Pradesh','247001')

--Check Data in the table
SELECT * FROM Distributor 

--MODIFY DATA
UPDATE Distributor 
SET ContactNo = '9837952830'
WHERE DistributorCode = 1

--DELETE AND TRUNCATE TABLE DATA

sp_rename 'Dist_Data', 'Distributor'





--SOME SYETM FUNCTIONS FOR ADMINISTRATORS AND DEVELOPERS

SELECT HOST_NAME() as [Host Name]

SELECT SUSER_ID('sa') as [SID]

SELECT USER_ID('sa') as [UID]

SELECT DB_ID('LibraryDB') as [DBID]

SELECT DB_NAME(19) as [DATABASE NAME]

SELECT OBJECT_ID('LibraryDb.dbo.Books') as [OBJID]





--Candidate

--CandidateId primary key,
--CandidateName
--DateOfBirth
--NoOfFamilyMembers
--AnnualIncome
--City
--ContactNo


sp_rename 'books.publisher_name', 'PublisherName' 

SELECT * FROM Books 
