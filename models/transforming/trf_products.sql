{{config(materialized='table', schema='transforming')}}
select productid, productname, supplierid, categoryid, quantityperunit, unitprice,
unitcost, unitsonorder, unitsinstock ,
IFF(unitsonorder-unitsinstock>0, 'Product is not avaliable', 'Product is avaliable') as productavailablity
from {{ ref ('stg_products') }}