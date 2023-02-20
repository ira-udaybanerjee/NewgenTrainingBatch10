  set implicit_transactions on
  
  set identity_insert dbo.orders on
  


  insert into orders (OrderId,OrderDateTime,CustomerId,SalespersonId)
  values (11, getdate(), 2, 3)
  
  insert into OrderDetails (OrderId,ProductId,QtySold,SalePrice)
  values (11, 1, 2, 18000)


  rollback transaction

  commit transaction



  select * from Orders 
  select * from OrderDetails 