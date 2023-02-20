SELECT * FROM Customer
where City = 'Saharanpur'

--Running total example

DECLARE @order_id int ,@product_id int,    
    @qty_sold decimal(10,2), @sale_price money, 
	@current_sale_amount money,
	@cumulative_sale_amount money
  
PRINT '------------------------ ORDER DETAILS --------------------------';    
  
DECLARE order_cursor CURSOR FOR     
SELECT orderid, productid, qtysold, saleprice 
FROM orderdetails 
order by orderid;    
  
OPEN order_cursor    
  
FETCH NEXT FROM order_cursor     
INTO @order_id, @product_id, @qty_sold, @sale_price 
  
print 'OrderId  ProductId  QtySold  SalePrice SaleAmount CumulativeSaleAmount'
print '----------------------------------------------------------------------'

set @current_sale_amount = @qty_sold * @sale_price 
set @cumulative_sale_amount = @current_sale_amount 
 
WHILE @@FETCH_STATUS = 0    --SUCCESSFUL FETCH
BEGIN     
  print CAST(@order_id as varchar(2)) + space(10) +   
        CAST(@product_id as varchar(3)) + space(10) +
		CAST(@qty_sold as varchar(6)) + space(4) +
		CAST(@sale_price as varchar(10)) + space(2) +
		CAST(@current_sale_amount as varchar(12)) + space(2) +
		CAST(@cumulative_sale_amount as varchar(12))
	
    FETCH NEXT FROM order_cursor     
    INTO @order_id, @product_id, @qty_sold, @sale_price      
	
	set @current_sale_amount = @qty_sold * @sale_price
	set @cumulative_sale_amount  = @cumulative_sale_amount + (@current_sale_amount)
	
END     
CLOSE order_cursor;    
DEALLOCATE order_cursor;    

--Alternate Solution

SELECT OrderId, ProductId, QtySold, SalePrice,
QtySold * SalePrice as [Amount]
FROM OrderDetails 






--SUM OVER FUNCTION ALLOWS YOU TO CALCULATE THE 
--CUMULATIVE TOTAL
SELECT OrderId, ProductId, QtySold, SalePrice, 
QtySold * SalePrice as [Sale Amount],
SUM(QtySold * SalePrice) OVER (Order By OrderId ROWS UNBOUNDED PRECEDING)
as [CumulativeSaleAmount]
from OrderDetails 





SELECT *, (QtySold * SalePrice) as [Sale Amount] FROM OrderDetails
Order By ProductId 
