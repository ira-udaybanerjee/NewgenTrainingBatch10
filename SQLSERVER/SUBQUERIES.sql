
--(A - B)

SELECT CustomerId FROM Customer 
EXCEPT
SELECT CustomerId FROM Orders 


SELECT CustomerId from Customer
EXCEPT
SELECT CustomerId from Orders 

-- (A Intersect B)
SELECT SalespersonId FROM Salesperson
INTERSECT
SELECT SalespersonId FROM Orders 

SELECT BookName FROM Books
UNION
SELECT ProductName FROM Product 








--NESTED QUERY OR SUBQUERY

SELECT * FROM Customer
WHERE CustomerId IN
(
SELECT CustomerId from Customer
EXCEPT
SELECT CustomerId from Orders 
)


SELECT * FROM Salesperson
WHERE SalespersonId IN
(
SELECT SalespersonId FROM Salesperson
INTERSECT
SELECT SalespersonId FROM Orders 
)

SELECT * FROM books 
WHERE Price = (SELECT Min(Price) From Books) 

--Details of all books with average price 
--greater than the average price of all English Books
SELECT * FROM Books
WHERE Price > (SELECT AVG(Price) FROM Books WHERE BookLanguage='English') 
AND BookLanguage = 'English'

SELECT * FROM Books
WHERE Price > (SELECT MAX(Price) FROM books WHERE BookLanguage='Hindi')


