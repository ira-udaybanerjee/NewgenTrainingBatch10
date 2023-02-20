
set statistics time on

set statistics io on

--Check and update statistics for order details table
sp_helpstats 'orderdetails'

select * from orderdetails 

DBCC SHOW_STATISTICS ('OrderDetails','_WA_Sys_00000002_36B12243')

UPDATE STATISTICS OrderDetails



--Check and update statistics for customer table
sp_helpstats 'customer'

CREATE STATISTICS Customer_Stats
ON Customer(CustomerId, CustomerName, [Address],[City],[MobileNo]); 

select * from customer

DBCC SHOW_STATISTICS('Customer','Customer_Stats')

UPDATE STATISTICS customer 


--
sp_helpstats 'productcategory'


