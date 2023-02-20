--AGGREGATE FUNCTIONS MAX, MIN, AVG, COUNT, SUM

SELECT * FROM Books

SELECT PublisherName, COUNT(PublisherName) as [No of Books]
FROM Books
GROUP BY PublisherName 

SELECT PublisherName, COUNT(*) as [No of Books]
FROM Books
GROUP BY PublisherName 

SELECT Category, COUNT(Category) as [No of Books]
FROM Books
GROUP BY Category 


SELECT Category, AVG(Price) as [Average Price]
FROM Books
GROUP BY Category 


SELECT PublisherName, Category, COUNT(*) as [Count]
FROM Books
GROUP BY PublisherName,category 


SELECT BookLanguage, MAX(Price) as [Max Price], MIN(Price) as [Min Price]
FROM Books
GROUP BY BookLanguage 



SELECT * FROM Books

SELECT PublisherName, Category, AVG(Price) as [Avg Price]
FROM Books
GROUP BY GROUPING SETS(PublisherName, Category, (PublisherName, Category), ())
ORDER BY PublisherName, Category


SELECT PublisherName, Category, AVG(Price) as [Avg Price]
FROM Books
GROUP BY CUBE (PublisherName, Category)
ORDER BY PublisherName, Category


SELECT PublisherName, Category, AVG(Price) as [Avg Price]
FROM Books
GROUP BY ROLLUP (Category, PublisherName)
ORDER BY PublisherName, Category



SELECT Category, AVG(Price) as [Average Price]
FROM Books
WHERE Category <> 'Novel'
GROUP BY Category 
HAVING AVG(Price) > 400