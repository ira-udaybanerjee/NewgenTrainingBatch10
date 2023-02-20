
create table Orders
(
OrderId int not null,
OrderDateTime datetime not null,

CustomerId int not null, 
SalespersonId int not null 
)

alter table orders
alter column CustomerId char(4) not null

alter table orders
add constraint pk_OrderId primary key(OrderId)

alter table orders
drop constraint pk_OrderId 


alter table orders
add constraint fk_Orders_CustomerId foreign key (CustomerId)
references Customer(CustomerId)


alter table orders
add constraint fk_Orders_SalespersonId foreign key (SalespersonId)
references Salesperson(SalespersonId)




create table OrderDetails
(
--create a foreign key on this field
--which relates to the orderid column in the orders table
OrderId int not null,

--create a foreign key on this field
--which relates to the productid column in the product table
ProductId int not null,

--numeric data type can be used for fixed size decimal values
--numeric(10,2) means 8 digits before decimal and 
--2 digits after the decimal are allowed (10 digits in all)
QtySold numeric(10,2) not null,
--money, smallmoney data type can be used where the value recorded
--has some monetary value
SalePrice smallmoney not null
)

alter table OrderDetails
add constraint fk_OD_Order_Id foreign key(OrderId)
references Orders(OrderId)

alter table OrderDetails
add constraint fk_OD_Product_Id foreign key(ProductId)
references Product(ProductId)




alter table OrderDetails
add constraint chk_OD_CheckQty
check (QtySold > 0)


alter table OrderDetails
add constraint chk_OD_SalePrice
check (SalePrice >= 1)


insert into orders values
(1, '2022-06-21', 1, 2)

insert into orderdetails values
(1, 2, 10, 15000),
(1, 3, 5, 17000),
(1, 1, 5, 20000)

insert into orders values
(2, '2022-06-22', 2, 3)

insert into OrderDetails values
(2, 2, 2, 16500),
(2, 4, 5, 17000)




select * from OrderDetails 


--orderid, orderdate, productname, qtysold, saleprice,
--customername, salespersonname
alter view vw_FullOrderDetails
as
select od.orderid, orderdatetime, customername, city,
salespersonname, productname,
qtysold, saleprice, QtySold * SalePrice as Amount
from orderdetails od join orders o on od.OrderId = o.orderid
join product p on od.ProductId = p.ProductId 
join customer c on o.customerid = c.CustomerId 
join salesperson s on o.salespersonid = s.SalespersonId 




select * from orderdetails

update orderdetails
set qtysold = 8
where orderid = 1 and productid = 2


--salespersonname and totalsaleamount

--average salesamount per city

--total qty sold by every salesperson per product
