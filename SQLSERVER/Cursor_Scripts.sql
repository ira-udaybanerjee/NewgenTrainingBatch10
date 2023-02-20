--Simple Example 1
DECLARE @order_id int ,@product_id int,    
    @qty_sold decimal(10,2), @sale_price money;    
  
PRINT '-------- ORDER DETAILS --------';    
  
DECLARE order_cursor CURSOR FOR     
SELECT orderid, productid, qtysold, saleprice 
FROM orderdetails 
order by orderid;    
  
OPEN order_cursor    
  
FETCH NEXT FROM order_cursor     
INTO @order_id, @product_id, @qty_sold, @sale_price    
  
print 'OrderId  ProductId  QtySold  SalePrice'
print '------------------------------------'
  
WHILE @@FETCH_STATUS = 0    
BEGIN    
    print CAST(@order_id as varchar(2)) + space(5) +   
        CAST(@product_id as varchar(3)) + space(5) +
		CAST(@qty_sold as varchar(6)) + space(5) +
		CAST(@sale_price as varchar(10)) + space(5)
  
      
    FETCH NEXT FROM order_cursor     
    INTO @order_id, @product_id, @qty_sold, @sale_price   
   
END     
CLOSE order_cursor;    
DEALLOCATE order_cursor;    

