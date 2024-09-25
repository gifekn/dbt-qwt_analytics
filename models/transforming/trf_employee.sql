{{config(materialized='table', schema='transforming')}}
select e.empid, e.first_name as employeename,
e.title as role,
e.hire_date as doj, e.year_salary as salary,e.extension,
IFF(mp.first_name is null, e.first_name, mp.first_name) as managername,
IFF(mp.title is null, e.title, mp.title) as managerrole,
o.address, o.city, o.postalcode, o.phone ,o.country
from {{ref("stg_employee")}} as e 
left join {{ref("stg_employee")}} as mp
on e.reports_to= mp.empid
left join {{ref("stg_office")}} as o 
on  e.office =  o.officeid
order by 1