SET XACT_ABORT ON


 BEGIN TRANSACTION t1

 INSERT INTO Orders
 VALUES ('00007',GETDATE(), 'C0001', 'SP002')

 INSERT INTO OrderDetails 
 VALUES ('00007','P0003',1,16500)

 INSERT INTO OrderDetails
 VALUES ('00007', 'P0002',1,20000)

 INSERT INTO OrderDetails
 VALUES ('00007', 'P0004', 1, 28000)

 COMMIT TRANSACTION t1


--Transaction is said to be committed when all the parts of the transaction
--run successfully
--When a transaction is committed it is logged in the log file

SELECT * FROM Orders 
SELECT * FROM OrderDetails 

DELETE Orders
WHERE OrderId = '00007'