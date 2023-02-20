select * from OrderDetails 

--Virtual Tables (Views)

--Write a complex query
select od.OrderId, o.OrderDateTime, p.ProductName, pc.CategoryName,
c.CustomerName, c.City, s.SalespersonName, od.QtySold,
p.StdPrice, od.SalePrice, cast(od.QtySold * od.SalePrice as numeric(10,2)) as [SaleAmount]
from OrderDetails od join Product p
on od.ProductId = p.ProductId 
join Orders o 
on od.OrderId = o.OrderId 
join Customer c 
on o.CustomerId = c.CustomerId 
join Salesperson s
on o.SalespersonId = s.SalespersonId 
left join ProductCategory pc
on p.CategoryId = pc.CategoryId 





--create a view for the complex query


create view vw_fullorderdetails
as
select od.OrderId, p.ProductName, pc.CategoryName,
c.CustomerName, c.City, s.SalespersonName, od.QtySold,
p.StdPrice, od.SalePrice, cast(od.QtySold * od.SalePrice as numeric(10,2)) as [SaleAmount]
from OrderDetails od join Product p
on od.ProductId = p.ProductId 
join Orders o 
on od.OrderId = o.OrderId 
join Customer c 
on o.CustomerId = c.CustomerId 
join Salesperson s
on o.SalespersonId = s.SalespersonId 
left join ProductCategory pc
on p.CategoryId = pc.CategoryId 



select * from vw_fullorderdetails 
where saleamount > 30000 













--Verify the Results

select * from vw_fullorderdetails 

--Verify updated data

select * from orders 

insert into orders
values (getdate(), 1, 3)

insert into OrderDetails 
values (9, 1, 1, 17000), (9, 2, 1, 18000)

--Alter View
alter view vw_fullorderdetails
as
select od.OrderId, o.OrderDateTime, p.ProductName, pc.CategoryName,
c.CustomerName, c.City, s.SalespersonName, od.QtySold,
p.StdPrice, od.SalePrice, cast(od.QtySold * od.SalePrice as numeric(10,2)) as [SaleAmount],
(p.StdPrice - od.SalePrice) * od.QtySold as [Discount_Surplus] 
from OrderDetails od join Product p
on od.ProductId = p.ProductId 
join Orders o 
on od.OrderId = o.OrderId 
join Customer c 
on o.CustomerId = c.CustomerId 
join Salesperson s
on o.SalespersonId = s.SalespersonId 
left join ProductCategory pc
on p.CategoryId = pc.CategoryId 
where cast(od.QtySold * od.SalePrice as numeric(10,2)) > 50000



--Verify the results 
select * from vw_fullorderdetails 
order by saleamount desc

/*
  Apply some data analysis queries 
  using view
*/

--Month wise sales
create view vw_MonthWiseSales
as
select month(orderdatetime) as [Month], year(orderdatetime) as [year], sum(saleamount) as [Month Wise Sales]
from vw_fullorderdetails
group by month(orderdatetime), year(orderdatetime) 

select * from vw_MonthWiseSales 

--Salesperson wise sales
select SalespersonName, SUM(saleamount) as [Sales Made]
from vw_fullorderdetails 
group by SalespersonName 


--Salesperson wise Monthly sales
select SalespersonName, month(orderdatetime) as [Month], year(orderdatetime) as [year], sum(saleamount) as [Month Wise Sales]
from vw_fullorderdetails 
group by SalespersonName, month(orderdatetime), year(orderdatetime) 


--Create view on the given query
create view vw_SPMonthlySales
as
select SalespersonName, month(orderdatetime) as [Month], year(orderdatetime) as [year], sum(saleamount) as [Month Wise Sales]
from vw_fullorderdetails 
group by SalespersonName, month(orderdatetime), year(orderdatetime) 

select * from vw_SPMonthlySales 
order by Year, Month, [Month Wise Sales] desc 

--drop a view

drop view vw_SPMonthlySales 

