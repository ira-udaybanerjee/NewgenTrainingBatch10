select * from OrderDetails 

select orderid, productid, 
qtysold as [QtySold],
saleprice as [Sale Price],
qtysold * saleprice as [saleamount],
CAST(
case 
  when qtysold * saleprice > 50000 then qtysold * saleprice * 0.20
  when qtysold * saleprice > 30000 then qtysold * saleprice * 0.15
  when qtysold * saleprice > 20000 then qtysold * saleprice * 0.10
  else 0
end
as numeric(10,2)
) as [Cashback]
from OrderDetails 

