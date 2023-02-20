   --to know the structure of a table or view
   sp_help customer 
   
   sp_help vw_fullorderdetails 

   --to know the script for the view

   sp_helptext vw_fullorderdetails
   
   sp_helptext prc_FullOrderDetailsByDate

   
   -- Self Join
   SELECT s1.SalespersonId, s1.SalespersonName,
   s1.DateOfJoining, s2.SalespersonName as [Team Leader Name]
   from Salesperson s1 LEFT JOIN Salesperson s2
   ON s1.TeamLeaderCode = s2.SalespersonId 

   --Rank Function  

   select OrderId, OrderDateTime, SalespersonName,
   SaleAmount,
   RANK() OVER (Order By SaleAmount Desc) as [Rank]
   from vw_fullorderdetails 
   --Order by SaleAMount DESC

   select * from books 
  
   --bookid, bookname, price, rank
   select bookid, bookname, price,
   ROW_NUMBER() OVER (Order By Price Desc) as [Rank]
   from books 

   select * from vw_fullorderdetails 

   select * from Orders 

   --Dense Rank Function
   select OrderId, OrderDateTime, SalespersonName,
   SaleAmount,
   DENSE_RANK() OVER (Order By SaleAmount desc) as [Rank]
   from vw_fullorderdetails 

   Order by SaleAMount DESC


   --Row Number Function
   
   select OrderId, OrderDateTime, SalespersonName,
   SaleAmount,
   ROW_NUMBER() OVER (Order By SaleAmount Desc) as [Sr Number]
   from vw_fullorderdetails 
   Order by SaleAMount DESC

   

   
   --CTE
   with cte_Sales as
   (
   select SalespersonName, SUM(SaleAmount) as [TotalSales]
   from vw_fullorderdetails  
   group by SalespersonName 
   )
   SELECT SalespersonName, TotalSales,
   DENSE_RANK() OVER (Order By TotalSales DESC) as [Rank]
   FROM cte_Sales 
    









	
   --Derived Table
   SELECT SalespersonName, TotalSales,
   DENSE_RANK() OVER (Order By TotalSales DESC) as [Rank]
   FROM
   (
   select SalespersonName, SUM(SaleAmount) as [TotalSales]
   from vw_fullorderdetails 
   group by SalespersonName 
   ) od




   --Pattern Matching and Between
   select * from Customer 
   where CustomerName between 'A' and 'E'

   select * from Customer 
   where CustomerName like '[A-D]%'

   select * from OrderDetails 
   where SalePrice between 16600 and 17000

 


 SELECT * FROM Salesperson 


 
   
   -- Self Join
   SELECT s1.SalespersonId, s1.SalespersonName,
   s1.DateOfJoining, s2.SalespersonName as [Team Leader Name]
   from Salesperson s1 LEFT JOIN Salesperson s2
   ON s1.TeamLeaderCode = s2.SalespersonId 



   --SELF JOIN
   SELECT s1.SalespersonId, s1.SalespersonName,
   s1.DateOfJoining, s2.SalespersonName as [Team Leader Name]
   FROM SalesPerson s1 LEFT JOIN Salesperson s2
   ON s1.TeamLeaderCode = s2.SalespersonId


   SELECT * FROM Salesperson 


  --Common Table Expression
  with bookpricerank
  as
  (
  select booklanguage, avg(price) as [avg price],
  rank() over (order by avg(price) desc) as [rank]
  from books  
  group by booklanguage 
  )
  select * from bookpricerank
  where [avg price] < 500

  --Derived Table
  select * from 
  (
  select booklanguage, avg(price) as [avg price],
  rank() over (order by avg(price) desc) as [rank]
  from books  
  group by booklanguage 
  ) bookrank
  where [rank] between 3 and 5
 
 --Temporary Table

  select booklanguage, avg(price) as [avg price],
  rank() over (order by avg(price) desc) as [rank]
  into #bookpricerank
  from books  
  group by booklanguage 

  select * from #bookpricerank 
  where rank between 2 and 5 