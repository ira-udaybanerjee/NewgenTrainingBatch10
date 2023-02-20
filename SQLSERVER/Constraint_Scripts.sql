--alter table column
alter table orderdetails
alter column orderid int not null

alter table orderdetails
alter column productid int not null

--altering table and creating primary key on key combination

alter table OrderDetails
add constraint pk_OrderProductId primary key
(orderid, productid)

--drop constraint
alter table OrderDetails
drop constraint pk_OrderProductId 

--recreate the constraint
alter table OrderDetails
add constraint pk_OrderProductId primary key
(orderid, productid)


--create unique constraint

alter table Product
add constraint unq_ProductName unique (ProductName)

--drop the constraint
alter table Product
drop constraint unq_ProductName 


--recreate unique constraint

alter table Product
add constraint unq_ProductName unique (ProductName)


select * from product 

insert into product
values (5, 'Vivo', 18000, 10, 1)

select * from orderdetails

insert into orderdetails
values (1,1,2,17000)


select * from orders 

select * from orderdetails 