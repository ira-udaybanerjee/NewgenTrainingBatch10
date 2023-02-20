SELECT * FROM Books



--GROUP BY

SELECT Category, COUNT(Category) as [Book Count]
FROM Books 
GROUP BY Category 

SELECT Category, AVG(Price) as [Average Price for Category]
FROM books
GROUP BY category 







--GROUP BY WITH HAVING
SELECT Category, COUNT(BookName) as [Book Count]
FROM Books 
GROUP BY Category 
HAVING COUNT(BookName) > 3












--GROUP BY MULTIPLE COLUMNS
SELECT BookLanguage, Publisher_Name, COUNT(BookName) as [Book Count]
FROM Books
GROUP BY BookLanguage, Publisher_Name 




--GROUP BY ROLLUP
SELECT BookLanguage, Publisher_Name, COUNT(BookName) as [Book Count]
FROM Books
GROUP BY 
ROLLUP(BookLanguage, Publisher_Name)  

SELECT BookLanguage, ISNULL(Publisher_Name, UPPER(CONCAT(BookLanguage,SPACE(1),'Total Count'))) as [Publisher Name], 
COUNT(BookName) as [Book Count]
FROM Books
GROUP BY 
ROLLUP(BookLanguage, Publisher_Name)  

SELECT Publisher_Name, BookLanguage, COUNT(BookName) as [Book Count]
FROM Books
GROUP BY 
ROLLUP(Publisher_Name, BookLanguage)  


SELECT Publisher_Name, 
ISNULL(BookLanguage, UPPER(CONCAT(Publisher_Name,SPACE(1),'Count'))) as [BookLanguage], 
COUNT(BookName) as [Book Count]
FROM Books
GROUP BY 
ROLLUP(Publisher_Name, BookLanguage)  

--GROUP BY CUBE

SELECT BookLanguage, Publisher_Name, COUNT(BookName) as [Book Count]
FROM Books
GROUP BY 
CUBE(BookLanguage, Publisher_Name)  





















--PIVOT FUNCTION 

SELECT 'Average Price' AS 'Average Price by Language',
[English],[Hindi],[Bengali]
FROM
(
SELECT BookLanguage, Price FROM Books
) AS src
PIVOT
(
AVG(Price) FOR BookLanguage IN ([English],[Hindi],[Bengali])
) AS pvt;

