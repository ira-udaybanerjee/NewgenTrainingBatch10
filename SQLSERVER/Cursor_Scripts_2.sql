SELECT * FROM OrderDetails 
WHERE SalePrice > 10000

--The results produced by any query is known as a result set / row set
--Set of Results / Set of Rows 

--Simple Example 2

DECLARE @order_id int ,@product_id int,    
    @qty_sold decimal(10,2), @sale_price money;  

  
DECLARE order_cursor CURSOR FOR     
SELECT orderid, productid, qtysold, saleprice 
FROM orderdetails 
order by orderid;    
  
OPEN order_cursor    
  
FETCH NEXT FROM order_cursor     
INTO @order_id, @product_id, @qty_sold, @sale_price    
  
WHILE @@FETCH_STATUS = 0    
BEGIN    
    
	select @order_id as [orderid], @product_id as [productid],
	@qty_sold as [qtysold], @sale_price as [saleprice]

    FETCH NEXT FROM order_cursor     
    INTO @order_id, @product_id, @qty_sold, @sale_price   
   
END     
CLOSE order_cursor;    
DEALLOCATE order_cursor;    

