select * from Product 

select * from OrderDetails 
--Insert and Update Trigger on Same Table

--When a new row is being inserted in the OrderDetails table
--I want to apply a check that the sale price of the product
--should not be beyond 80% or 120% of original price
--Example: Price 100, the Sale Price cannot greater than 120 or less than 80

--Trigger is Database Object
create trigger trg_CheckPrice
on orderdetails
for insert, update
as 
begin
   declare @SalePrice money
   select @SalePrice = saleprice from inserted --10000

   declare @ProductId char(5)
   select @ProductId = productid from inserted --1

   declare @StdPrice money
   select @StdPrice = StdPrice from Product where ProductId = @ProductId --select stdprice from product where productid = 1
   --18000

   declare @difference money

   set @difference = (@SalePrice - @StdPrice) / @StdPrice -- (10000 - 18000) / 18000 = -.44
   
   if abs(@difference) > 0.20
   begin
      /*print 'The discount or surplus can not be more than 20 percent of standard price' 
	  rollback*/
	  ;throw 99999, 'Invalid Sale Price', 16
   end
end

set xact_abort on
begin  transaction
    insert into Orders (OrderId, OrderDateTime,CustomerId,SalespersonId)
    values ('00010', getdate(), 'C0001', 'SP003')

	--Exception should be raised by trigger
    insert into OrderDetails
    values ('00010', 'P0001',1 , 18200)

	insert into OrderDetails
    values ('00010', 'P0002',2 , 18000)
commit transaction

--delete trigger
create trigger trg_PreventCustomerDelete
on Customer
for delete
as
begin
  print 'Deletion of customer is not allowed'
  rollback
end


--update trigger

create trigger trg_PreventUpdateBooks
on Books
for update
as 
begin
   print 'Updation of Books is not allowed'
   rollback
end

drop trigger trg_PreventUpdateBooks 

