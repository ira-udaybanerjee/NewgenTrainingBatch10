SELECT * FROM Product 

CREATE TABLE ProductCategory
(
CategoryId char(2) primary key,
CategoryName varchar(50) not null
)

SELECT * FROM Product 

ALTER TABLE Product
ADD CategoryId char(2)

ALTER TABLE Product
ADD CONSTRAINT fk_Pro_Category_Id FOREIGN KEY (CategoryId)
REFERENCES ProductCategory(CategoryId)

INSERT INTO ProductCategory 
VALUES ('PR', 'Premium'), ('BD', 'Budget'), ('EX', 'Executive')

UPDATE Product
SET CategoryId = 'EX'
WHERE ProductId = 4


SELECT * FROM Product 

--Default Join is known as an inner join
SELECT ProductId, ProductName, StdPrice, CategoryName
FROM Product p JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 

--Outer join
SELECT ProductId, ProductName, StdPrice, CategoryName
FROM Product p LEFT OUTER JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 


--Outer join
SELECT ProductId, ProductName, StdPrice, CategoryName
FROM ProductCategory pc RIGHT OUTER JOIN Product p
ON pc.CategoryId = p.CategoryId 


INSERT INTO ProductCategory 
VALUES ('LM','Limited Edition')


SELECT ProductId, ProductName, StdPrice, CategoryName
FROM Product p RIGHT JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 


SELECT ProductId, ProductName, StdPrice, CategoryName
FROM Product p FULL JOIN ProductCategory pc
ON p.CategoryId = pc.CategoryId 