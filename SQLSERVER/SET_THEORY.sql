select * from product 

select * from books 


--UNION

SELECT ProductName FROM Product
EXCEPT
SELECT BookName FROM Books 


SELECT BookName FROM Books 
EXCEPT
SELECT ProductName FROM Product


SELECT * FROM Customer 

SELECT * FROM Orders 

SELECT CustomerId from Customer
EXCEPT
SELECT CustomerId FROM Orders 