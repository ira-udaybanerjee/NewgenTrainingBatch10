SELECT * FROM OrderDetails 

SET STATISTICS IO ON

ALTER PROCEDURE prc_CheckOrdered @ProductId int
AS
BEGIN
IF (SELECT COUNT(*) FROM OrderDetails WHERE ProductId = @ProductId) < 1
  PRINT CONCAT(CAST(@ProductId as varchar(10)), ' is an unordered product')
ELSE 
  PRINT CONCAT(CAST(@ProductId as varchar(10)), ' is an ordered product')
END

prc_CheckOrdered 5


CREATE PROCEDURE prc_CheckOrdered1 @ProductId int
AS
BEGIN
IF NOT EXISTS(SELECT * FROM OrderDetails WHERE ProductId = @ProductId)
  PRINT CONCAT(CAST(@ProductId as varchar(10)), ' is an unordered product')
ELSE 
  PRINT CONCAT(CAST(@ProductId as varchar(10)), ' is an ordered product')
END

  
prc_CheckOrdered1 7





select count(*) from orderdetails where productid = 1


select * from OrderDetails 
where ProductId = 7