
--SUBQUERY (NESTED QUERY)

SELECT * FROM Product
WHERE ProductId 
IN
( 
  Select ProductId from OrderDetails
)


--SUBQUERY
--OUTER QUERY IS DEPENDANT ON INNER QUERY
SELECT * FROM Books
WHERE PRICE >
(SELECT AVG(Price) from Books) 


SELECT * INTO CustomerCopy
FROM Customer

select BookId, BookName, AuthorName, Price into PremiumBooks
from books 
where price > 
(
 select avg(price) from books
)


select * from PremiumBooks 



sp_rename 'PremiumBooks', 'CostlyBooks'


select * from CostlyBooks 