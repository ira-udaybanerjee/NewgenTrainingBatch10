select * from OrderDetails 

select * from Product 
--TRIGGERS
--Triggers can be compared to event handlers
--DML Triggers
--Work as handlers(response) for DML Statements
--DML Triggers get fired in response to the execution of any DML statement

--Example:
--When a new row is being inserted in the orderdetails table
--I want the value of the sales price to be not more than 20% above the
--Standard Price of the product





--MAGIC TABLES
--Temporary tables that are created when DML statement is fired on a table
 
-- Two types

-- 1. Inserted Magic Table
-- 2. Deleted Magic Table

--When Insert Statement is Fired on a Table, inserted magic table is created

--When Delete Statement is Fired on a Table, deleted magic table is created

--When Update Statement is Fired on a Table, 
--both deleted and inserted magic table are created



insert Customer
values (7, 'Sunil', 'Awas Vikas', 'Saharanpur', '9837998379')



--Magic Table (inserted)

--CustomerId, CustomerName, Address, City, MobileNo
--5, Sunil, Awas Vikas, Saharanpur, 9837998379

--If all OK, the data is transferred to Actual Table from Magic Table

delete customer
where CustomerId = 1

--Magic Table (deleted)
--CustomerId, CustomerName, Address, City, MobileNo
--1, _________, __________________, _______________, _____________



update Customer
set MobileNo = null
where CustomerId = 1

--Magic Table

--Two magic tables

--deleted 
--CustomerId, CustomerName, Address,      City,    MobileNo
--   2          ABC         Sadar Bazar  Delhi		9898989

--inserted
--CustomerId, CustomerName, Address, City, MobileNo
--   2          ABC         Park Road	 Dehradun	null



