SELECT * FROM Product

SELECT * FROM ProductCategory 

--INNER JOIN
SELECT p.ProductId, p.ProductName,p.StdPrice, pc.CategoryName
FROM Product p JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 

--OrderId, OrderDateTime, CustomerName Orders JOIN Customer

--LEFT/RIGHT/FULL OUTER JOIN
SELECT p.ProductId, p.ProductName,p.StdPrice, pc.CategoryName
FROM Product p LEFT JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 


SELECT p.ProductId, p.ProductName,p.StdPrice, pc.CategoryName
FROM Product p RIGHT JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 


SELECT p.ProductId, p.ProductName,p.StdPrice, pc.CategoryName
FROM Product p FULL JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 

--JOINING MULTIPLE TABLES


select * from OrderDetails 

--OrderId, OrderDate, ProductName, QtySold, SalePrice

SELECT od.OrderId, o.OrderDateTime, p.ProductName, od.QtySold, od.SalePrice
FROM OrderDetails od JOIN Orders o ON od.OrderId = o.OrderId 
JOIN Product p ON od.ProductId = p.ProductId 

