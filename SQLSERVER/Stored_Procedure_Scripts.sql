
--create a stored procedure with select

create procedure prc_OrderDetails
as
select * from vw_fullorderdetails 

exec prc_OrderDetails 



--create a parameterized stored procedure
create procedure prc_FullOrderDetailsByDate @OrderDate datetime
as
select * from vw_FullOrderDetails
where day(orderdatetime) = day(@OrderDate) 
and month(orderdatetime) = month(@OrderDate)
and year(orderdatetime) = year(@OrderDate) 

--A stored procedure can contain and execute a view
--but a view can not contain and execute a stored procedure

prc_FullOrderDetailsByDate '2020-08-05'


select * from vw_fullorderdetails 


alter procedure prc_FullOrderDetailsByCity @City varchar(50) = 'Saharanpur'
as
select * from vw_fullorderdetails
where city = @city


--find out the error
prc_fullorderdetailsbycity 'Dehradun'




--error
create view vw_execsp
as
exec prc_FullOrderDetailsByDate '2020-08-05'



--return single value from stored procedure

alter procedure prc_GetTotalSalesByMonth @M tinyint = 8, @Y smallint = 2020
as
begin

  declare @TotalSales money

  select @TotalSales=SUM(SaleAmount)
  from vw_fullorderdetails
  where MONTH(orderdatetime) = @M and YEAR(orderdatetime) = @Y

  return cast(@TotalSales as numeric(10,2))

end


declare @TSales money
exec @TSales = prc_GetTotalSalesByMonth 12,2021
select CAST(@TSales as numeric(10,2)) as [Kul Bikri] 








--create procedure to get total order amount for very order

create procedure prc_GetTotalAmountPerMonth 
@Month tinyint, @Year int,
@TotalSales money out, @MinimumSales money out, @MaximumSales money out
as
begin 
   
   select @TotalSales=SUM(SaleAmount), @MinimumSales=MIN(SaleAmount), 
   @MaximumSales=MAX(SaleAmount) 
   from vw_fullOrderDetails
   where MONTH(orderdatetime) = @Month and YEAR(orderdatetime) = @Year   
   
end






--get values from output parameters
declare @MaxSale money
declare @MinSale money
declare @TotalSale money

exec prc_GetTotalAmountPerMonth 8, 2020, @TotalSale out, @MinSale out, @MaxSale out

select @MaxSale as [Max Sales], @MinSale as [Min Sales], @TotalSale as [Total Sales]







--create a stored procedure to perform the above task
create procedure prc_GetSalesStatsByMonth @Month tinyint, @Year smallint
as
begin
	declare @MaxSale money
	declare @MinSale money
	declare @TotalSale money

	exec prc_GetTotalAmountPerMonth @Month, @Year, @TotalSale out, @MinSale out, @MaxSale out

	select @MaxSale as [Max Sales], @MinSale as [Min Sales], @TotalSale as [Total Sales]
end

--execute the above procedure
exec prc_GetSalesStatsByMonth 8, 2020

--create procedure for inserting new product

create procedure prc_InsertProduct @ProductId int, @ProductName varchar(50),
                            @StdPrice money, @OpeningStock decimal(10,2), 
							@CategoryId int = 1
as
begin
    insert into Product 
	values (@ProductId, @ProductName, @StdPrice, @OpeningStock, @CategoryId, NULL)
end


--Stored Procedures can also contain
--DML, DDL and DCL statements apart from DQL
--View can only contain DQL statements
--execute the procedure

prc_InsertProduct 6, 'One Plus', '32000',10, 2

select * from Product 


select * from vw_fullorderdetails 


--category, month, year (parameter)
--return totalqtysold sum(qtysold)


select * from books 


--input parameter (publishername)
--return minimum book price, maximum book price, average book price

create procedure prc_GetPublisherDetails @PubName varchar(50), @MinPrice int out, @MaxPrice int out, @AvgPrice numeric(6,2) out
as
begin
  select @MinPrice = MIN(Price), @MaxPrice = MAX(Price), @AvgPrice = AVG(Price)
  FROM Books
  WHERE Publisher_Name = @PubName 
end


create procedure prc_CallPubDetails @PublisherName varchar(50)
as
begin
   declare @Min int
   declare @Max int
   declare @Avg numeric(6,2)

   exec prc_GetPublisherDetails @PublisherName, @Min out, @Max out, @Avg out

   select @PublisherName as [Publisher], @Min as [Min Book Price], @Max as [Max book Price], @Avg as [Avg Book Price]
end



prc_CallPubDetails 'BPB'