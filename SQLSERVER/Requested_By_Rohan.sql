select * from books 


--Book Language, COUNT 

SELECT BookLanguage, COUNT(*) as NoOfBooks
FROM Books
GROUP BY BookLanguage


SELECT Publisher_Name, COUNT(*) as NoOfBooks
From Books
GROUP BY Publisher_Name


SELECT Publisher_Name, AVG(Price) as AveragePrice
FROM Books
GROUP BY Publisher_Name 

SELECT Category, MIN(Price) as [Least Expensive], 
MAX(Price) as [Most Expensive]
FROM Books
GROUP By category 

select * from Customer 

SELECT City, COUNT(*) as [No of Customers]
FROM Customer
GROUP BY City 


SELECT Publisher_Name, Category, COUNT(*) as [No of Books]
FROM Books
GROUP BY Publisher_Name, Category 
ORDER BY Publisher_Name 



SELECT Publisher_Name, AVG(Price) as AveragePrice
FROM Books
GROUP BY Publisher_Name 
HAVING AVG(Price) > 550


--write a query to show the maximum price per category
--make sure only those details are shown where maximum price 
--per category is greater than 600


SELECT category, MAX(Price) as [Max Price]
FROM Books
GROUP BY category 
HAVING MAX(Price) > 600 