--ACID
-- A (ATOMICITY)
-- C (CONSISTENCY)
-- I (ISOLATION)
-- D (DURABILITY)

select * from orders
select * from OrderDetails 

SET IDENTITY_INSERT dbo.Orders ON

SELECT * FROM Orders 

--without try catch
begin transaction t1
 
  insert into orders (OrderId, OrderDateTime, CustomerId, SalespersonId)
  values (9, getdate(), 1, 2)
  
  --Exception in this insert (Wrong Product Id) --Foreign Key Error
  insert into OrderDetails (OrderId, ProductId,QtySold, SalePrice)
  values (9, 112, 2, 18000) 
  
commit transaction t1

--with try catch


select * from Orders 

begin transaction t1
	 begin try
	      --Exception at any of these statement, the execution halts
		  --and the control is shifted to the catch block
		  --and whatever statements are specified in the catch
		  --block, they are executed
		  insert into orders(OrderId, OrderDateTime, CustomerId, SalespersonId)
		  values (10, getdate(), 2, 3)
		  
		  insert into OrderDetails (OrderId, ProductId,QtySold, SalePrice)
		  values (10, 1, 1, 1800)
		 
		  insert into OrderDetails (OrderId, ProductId,QtySold, SalePrice)
		  values (10, 3, 1, 17000)
		  
		  commit transaction t1 --Changes finalized
	 end try
	 begin catch
	      SELECT   
		  @@ERROR as [ErrorCode],
          ERROR_NUMBER() AS ErrorNumber, ERROR_SEVERITY() AS ErrorSeverity, ERROR_STATE() AS ErrorState,
		  ERROR_PROCEDURE() AS ErrorProcedure, ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS ErrorMessage
		  
		  rollback transaction t1
	 end catch



	 select * from orders 

	 select * from OrderDetails 