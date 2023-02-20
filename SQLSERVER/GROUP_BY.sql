
SELECT * FROM EmpSalary 

SELECT Branch, SUM(Salary) AS [Salary Paid]
FROM EmpSalary
GROUP BY Branch 

SELECT Department, MAX(Salary) as [Max Salary]
FROM EmpSalary
GROUP BY Department 

SELECT Category, AVG(salary) as [average salary]
from empsalary
group by category 

INSERT EmpSalary
VALUES ('Axar', 'Sales', 'A', 9000, 'Delhi')

select * from empsalary 


select branch,department, avg(salary) as [avg salary dept wise]
from empsalary
group by branch, department
having avg(salary) < 6000
order by branch




--orderid, orderdatetime, customername,
--productname, categoryname, qtysold,
--saleprice, saleamount (qtysold * saleprice), salespersonname

select orders.orderid, orderdatetime, customername, city,
productname, categoryname, qtysold, saleprice,
qtysold * saleprice as [saleamount], salespersonname
into ordersheet
from orders join orderdetails on orders.orderid = orderdetails.orderid
join customer on orders.customerid = customer.customerid 
join product on orderdetails.ProductId = product.productid 
join ProductCategory on product.categoryid = ProductCategory.CategoryId 
join salesperson on orders.SalespersonId = salesperson.salespersonid


select * from ordersheet 

select orderid, sum(saleamount) as [Total Amount]
from ordersheet
group by orderid 

select categoryname, avg(saleamount) as [Avg Sales]
from ordersheet
group by categoryname 

select city, categoryname, sum(qtysold) as [total qty sold]
from ordersheet
group by city, categoryname
having sum(qtysold) > 3


select salespersonname, count(*) as [No of orders]
from ordersheet
where city = 'Dehradun'
group by salespersonname



select * from ordersheet 