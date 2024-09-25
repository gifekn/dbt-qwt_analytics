{{ config(materialized = 'incremental', unique_key = ['OrderID', 'Lineno']) }}
 
select
 
od.*,
o.orderdate
 
from
 
{{source('qwt_src', 'OrderDetails')}} as od
 
inner join
 
{{ref('stg_orders')}} as o
 
on od.OrderID = o.OrderID
 
 
{% if is_incremental() %}
 
  -- this filter will only be applied on an incremental run
  where o.orderdate > (select max(orderdate) from {{ this }} )
 
{% endif %}
