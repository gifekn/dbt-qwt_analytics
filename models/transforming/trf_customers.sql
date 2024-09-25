{{config(materialized = 'table', schema='transforming',prehook=['grant select on table stg_customers to role public;'] ) }}
 
with customerCTE as
(
select
customerid,
companyname,
contactname,
city,
country,
divisionid,
address,
fax,
phone,
postalcode,
IFF(StateProvince = '', 'NA', StateProvince) as statename
 
 
from {{ ref ('stg_customers') }}
)
 
select * from customerCTE