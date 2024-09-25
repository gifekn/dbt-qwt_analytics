{{config(materialized='table', schema='reporting')}}
with customers as(
    select customerid,
    companyname,
    contactname
    from {{ ref ("dim_customer") }}

),
orders as(
    select orderid,
    customerid, orderdate
    from {{ ref ("fct_orders") }}
),
customer_orders as(
    select customers.customerid as customerid,
    customers.companyname as companyname,
    customers.contactname as companyname,
    min(orders.orderdate) as min_orderdate,
    max(orders.orderdate) as max_orderdate,
    count(orders.orderdate) as total_orders
    
    from orders inner join customers on orders.orderid = customers.customerid
    group by companyname, contactname
)
select * from customer_orders

