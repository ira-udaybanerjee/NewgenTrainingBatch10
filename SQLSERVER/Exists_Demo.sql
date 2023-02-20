--exists 
select * from product 

select * from orderdetails 

--example of a correlated subquery using exists 
select * from product p
where exists (select * from OrderDetails where ProductId =  p.ProductId)


