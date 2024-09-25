{{config(materialized='table', schema='transforming')}}
select  
od.*,
(od.unitprice*od.quantity) * (1-od.discount) as linesalesamount ,
pro.unitcost *od.quantity as costofgoodsold,
(od.unitprice *od.quantity) *(1-od.discount) -(pro.unitcost *od.quantity) as margin
from {{ref('stg_orderdetails')}}  as od inner join {{ref('stg_products')}} as pro 
on od.productid=pro.productid
