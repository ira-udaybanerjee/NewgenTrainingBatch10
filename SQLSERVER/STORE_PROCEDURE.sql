--Stored Procedure

alter procedure prc_Orders @city varchar(50) 
as
select * from vw_FullOrderDetails 
where city = @city

--select * from vw_FullOrderDetails where city='Delhi'

--Execute a procedure
exec prc_Orders 'Delhi'


create procedure prc_SalesBySP @SPName varchar(50)
as
select * from vw_FullOrderDetails 
where salespersonname = @SPName 


exec prc_SalesBySP 'Rakesh' 

select * from books 

--Create a stored procedure
--that takes the publishername and language as parameter
--and displays the BookId, BookName, AuthorName and Price
--of the filtered books
ALTER procedure [prc_BooksByPublisherAndLanguage] 
@pubname varchar(50), @lang varchar(20) = 'English'
as
select bookid, bookname, authorname, price
from books
where Publisher_Name = @pubname and BookLanguage = @lang


--order by can be applied only with a select statement
--because stored procedures are executed using exec and not select
--so we cannot apply an order by while executing the stored procedure
exec [prc_BooksByPublisherAndLanguage] 'BPB','Hindi'
order by authorname


select * from vw_FullOrderDetails 
order by salespersonname 


--group by
--order by
--where
--having
--all these clause can be used only with select statement


select * from customer

--Stored Procedures can also run DML statements
--Insert, Update, Delete, Truncate
--But Views can not run DML Statements
alter procedure prc_InsertCustomer
@CustomerId int, @CustomerName varchar(50), @Address varchar(100), 
@City varchar(50), @MobileNo varchar(50) 
as
insert into customer
values (@CustomerId, @CustomerName, @Address, @City, @MobileNo)
select * from customer


prc_InsertCustomer 4, 'Bhakti', 'Peddar Road', 'Mumbai', '9997798978'

 
