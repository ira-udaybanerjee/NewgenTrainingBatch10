--UDF (User Defined Functions)

--Table Valued Function
create function fx_GetSalesByMonth (@Month tinyint, @Year smallint)
returns table -- what type of object our function is returning
as
return --specifies the data / row / rows that our function should return
select * from vw_fullorderdetails 
where Month(OrderDateTime) = @Month and YEAR(OrderDateTime) = @Year 


select * from dbo.fx_GetSalesByMonth(7, 2022)






--Books 
--Language (Input)
--return
--all details books of that language


--Example of in built scalar function
SELECT MONTH(getdate())

--scalar function (returns a single value)

alter function fx_GetRebate(@Saleamount money)
returns money
as
begin
   declare @rebateamount money   
   
   select @rebateamount =
     
	  case 
	      when @Saleamount > 100000 then (0.15 * @Saleamount) 
		  when @Saleamount > 50000 then (0.10 * @Saleamount)
		  when @Saleamount > 30000 then (0.05 * @Saleamount)
		  else 0
	  end 
	  /*
	  if @Saleamount > 100000 
	       select @rebateamount = 0.15 * @Saleamount
	  else if @Saleamount > 50000
	       select @rebateamount = 0.10 * @Saleamount
	  else if @Saleamount > 30000
	       select @rebateamount = 0.05 * @Saleamount*/	      

	return @rebateamount
end



SELECT dbo.fx_GetRebate(60000) as RebateAmount



select orderid, orderdatetime, year(orderdatetime) as year, amount,
dbo.fx_GetRebate(amount) as [Rebate]
from vw_fullorderdetails 





select * from books 

--Category (input)
--Count of Books in that Category

create function fx_GetCategoryCount(@category varchar(50))
returns int
as
begin
   declare @bookcount int
   select @bookcount = count(*) from books
   where category = @category
   return @bookcount
end

select distinct category, dbo.fx_GetCategoryCount(category) as [category]
from books 