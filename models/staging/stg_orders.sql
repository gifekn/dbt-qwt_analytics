{{config(materialized='incremental', unique_key='Orders_ID') }}
select * from {{ source('qwt_src', 'orders') }}

{%if is_incremental() %}
    where OrderDate>= (select max(OrderDate) from {{this}})

{% endif %}


