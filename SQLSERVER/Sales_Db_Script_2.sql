select * from product

create table ProductCategory
(
CategoryId int primary key,
CategoryName varchar(50) not null,
CategoryDescription varchar(100)
)


insert ProductCategory
values (1, 'Budget', 'Between 5000 and 30000')

insert ProductCategory 
values (2, 'Premium', 'Above 30000')


select * from ProductCategory 




alter table Product
add CategoryId int 
references ProductCategory(CategoryId) 




alter table Product
add ProductDescription varchar(100)





select * from Product 



--update category id

update product
set categoryid = 1
where productid in (1,2)

update product
set categoryid = 2
where productid = 3

--
insert into product
values (5, 'Nokia', 10.00, 14000,1,'Budget Phone By Nokia. Good choice for all.')

select * from Product 

--productid, productname, stdprice, openingstock, categoryname

select productid, productname, stdprice, openingstock, categoryname
from Product left join ProductCategory on product.categoryid = ProductCategory.CategoryId


insert ProductCategory 
values (3, 'Exclusive', 'Exclusive and limited range')

select * from ProductCategory 

select productid, productname, stdprice, openingstock, categoryname
from Product p join ProductCategory pc on p.categoryid = pc.CategoryId

select productid, productname, stdprice, openingstock, categoryname
from Product p left join ProductCategory pc on p.categoryid = pc.CategoryId

select productid, productname, stdprice, openingstock, categoryname
from Product right join ProductCategory on product.categoryid = ProductCategory.CategoryId

select productid, productname, stdprice, openingstock, categoryname
from Product full join ProductCategory on product.categoryid = ProductCategory.CategoryId


--Default (Inner Join)
--left/right/full (Outer Join)


SELECT Productname from Product 

SELECT CategoryName from ProductCategory 


--CROSS JOIN PRODUCES A RESULTSET WHICH IS A PRODUCT OF THE NUMBER OF ROWS IN EACH TABLE
--TO DERIVE SOME MEANINGFUL DATA YOU NEED TO APPLY FILTERS ON THE BASES OF THE RELATED COLUMNS IN THE TABLE
SELECT ProductName, CategoryName
FROM Product CROSS JOIN ProductCategory 
WHERE Product.CategoryId = ProductCategory.CategoryId 

--SELF JOIN

SELECT * FROM OrderDetails 

UPDATE OrderDetails
SET QtySold = 12
WHERE OrderId = 4 AND ProductId = 2

UPDATE Product
SET CategoryId = 1
WHERE ProductId = 2

--OrderId, ProductName, ProductCategory,
--CustomerName, QtySold, SalePrice,
--SaleAmount i.e. QtySold * SalePrice

ALTER VIEW vw_Sales_Performance
AS
SELECT od.OrderId, p.ProductName, cat.CategoryName, cat.CategoryDescription,
c.CustomerName, sp.SalespersonName, od.QtySold, od.SalePrice, 
od.QtySold * od.SalePrice as [Sale Amount]
from OrderDetails od JOIN Orders o 
ON od.OrderId = o.OrderId JOIN Product p 
ON od.ProductId = p.ProductId JOIN ProductCategory cat
ON p.CategoryId = cat.CategoryId JOIN
Customer c on c.CustomerId = o.CustomerId JOIN 
Salesperson sp ON o.SalespersonId = sp.SalespersonId 




--View is a virtual table. It is not the actual table

SELECT * FROM vw_Sales_Performance
ORDER BY SalespersonName 

--vw_SalespersonDetails