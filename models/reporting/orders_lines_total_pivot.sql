{{ config (materialized='view',schema='reporting') }}
{% set each_lineno=get_order_linenos() %}
select orderid,
{% for Linenumber in each_lineno %}
sum(case when Lineno={{Linenumber}} then linesalesamount end) as lineno_{{Linenumber}}_amount,
{% endfor %}
sum(linesalesamount) as totalamount
from {{ref ('trf_orderdetails') }}
group by orderid