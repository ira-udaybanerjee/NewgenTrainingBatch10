SELECT * FROM Orders 

--OrderId, OrderDateTime, CustomerName, SalespersonName


SELECT OrderId, OrderDateTime, CustomerName, SalespersonName
INTO Orders_Copy --should not be present in the database
FROM Orders o JOIN Salesperson s
ON o.SalespersonId = s.SalespersonId
JOIN Customer c
ON o.CustomerId = c.CustomerId 



--No of Books in each language
--Copy this output in a new table names
--Language_Details

SELECT * FROM Books 

INSERT INTO Books
Values ('B2566','Python Programming','Gagan Singh', 300,
'2022-07-01','BPB','Programming Language', 'English')

SELECT BookLanguage, COUNT(*) as [No of books]
FROM books
GROUP BY BookLanguage 


CREATE TABLE Book1
(
BookId char(4) primary key,
BookName varchar(50) not null,
AuthorName varchar(50),
Price int
)



CREATE TABLE Book2
(
BookId char(4) primary key,
BookName varchar(50) not null,
AuthorName varchar(50),
Price int
)


select * into book2 from book1


insert into book2
select * from book1




select * from bookcopy1 

alter table book1
add [description] varchar(200)

alter table book1
alter column [description] varchar(500) 

sp_rename 'bookcopy1.remarks', 'description', 'column'

sp_rename 'book2', 'bookcopy2'

alter table bookcopy2
add description varchar(500) 


