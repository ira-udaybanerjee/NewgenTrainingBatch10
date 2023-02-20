--with try catch and Savepoint
select * from customer
select * from orders


begin transaction
	 begin try
	     

		  insert into orders 
		  values (12, getdate(), 6, 3)
		
		  insert into OrderDetails 
		  values (12, 1, 1, 18000)

		  --Exception occurs
		  insert into OrderDetails
		  values (12, 3, 1, 17000)		
		  
		  commit transaction

	 end try
	 begin catch
	      SELECT   
		  @@ERROR as [Error Code]  
		  rollback transaction
    end catch


	
select * from Customer 

select * from Orders 
select * from OrderDetails 
