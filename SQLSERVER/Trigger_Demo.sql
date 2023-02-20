select * from Product 

select * from OrderDetails 
--Insert and Update Trigger on Same Table

--Trigger is Database Object
create trigger trg_CheckPriceOnInsert
on orderdetails
for insert
as 
begin
   declare @SalePrice money
   select @SalePrice = saleprice from inserted --10000

   declare @ProductId int
   select @ProductId = productid from inserted --1

   declare @StdPrice money
   select @StdPrice = StdPrice from Product where ProductId = @ProductId --select stdprice from product where productid = 1
   --18000

   declare @difference money

   set @difference = (@SalePrice - @StdPrice) / @StdPrice -- (10000 - 18000) / 18000 = -.44
   
   if abs(@difference) > 0.20
   begin
      print 'The discount or surplus can not be more than 20 percent of standard price' 
	  rollback
   end
end

--magic table (inserted)
--OrderId        ProductId           QtySold        SalePrice
--  18              1                  1             10000
 set identity_insert dbo.orders on

begin transaction t1
  begin try
  
    insert into Orders (OrderId, OrderDateTime,CustomerId,SalespersonId)
    values (15, '2022-07-23', 3, 2)

	--Exception should be raised by trigger
    insert into OrderDetails
    values (15, 3, 1, 32000)

    commit transaction t1
  end try
  begin catch
      print ('Invalid sale price')
	  rollback transaction t1
  end catch

  select * from Orders 
  select * from orderdetails

  select * from Product 


create trigger trg_CheckPriceOnUpdate
on orderdetails
for update
as 
begin
   declare @SalePrice money
   select @SalePrice = saleprice from inserted

   declare @ProductId int
   select @ProductId = productid from inserted 

   declare @StdPrice money
   select @StdPrice = StdPrice from Product where ProductId = @ProductId 

   declare @difference money

   set @difference = (@SalePrice - @StdPrice) / @StdPrice 

   if update(SalePrice) and abs(@difference) > 0.20
   begin
      print 'The discount or surplus can not be more than 20% of standard price'
      rollback transaction
   end
end

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

update books
set bookname = 'Indian Idol'
where BookId = 'B1100'





drop trigger trg_PreventCustomerDelete



delete customer
where CustomerId = 3


select * from customer 

select * from orders 

insert into Customer
values (5, 'Aditi', 'Park Road', 'Dehradun', '9634963490')


delete customer 
where CustomerId= 4

select * from Customer 

select * from orders 

select * from orderdetails 

  insert into orders 
  values (getdate(), 1, 3)

   declare @NewOrderId int
   select @NewOrderId = SCOPE_IDENTITY()

  insert into OrderDetails 
  values (@NewOrderId, 3, 1, 80000)
		  

		  select * from orders

		  select * from orderdetails 



select * from books 

alter table books
add constraint chk_MinPrice check (Price >= 100)

update books
set price = 99
where bookid = 'B1100'

alter table books with nocheck
add constraint chk_NoBiography 
check (category <> 'Biography') 



alter table books with nocheck
add constraint chk_oldpublishdate 
check (year(publish_date) > 1990) 







update books
set category = 'Biography'
where bookid = 'B1100'



select * from books 
select * from orders 

alter table orders with nocheck
add constraint chk_NoSunday
check (datename(dw,OrderDateTime) <> 'Sunday')


update orders
set OrderDateTime = '2022-07-24'
where orderdatetime = 1




insert into orders
values (16, '2022-07-17', 2, 1)


select * from orders 