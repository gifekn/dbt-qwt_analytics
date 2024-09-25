{{config(materialized='table',schema='transforming')}}
select get(xmlget(supplierinfo, 'SupplierID'), '$') as supplierid,
get(xmlget(supplierinfo, 'CompanyName'), '$') ::varchar as Companyname,
get(xmlget(supplierinfo, 'ContactName'), '$') ::varchar as ContactName,
get(xmlget(supplierinfo, 'Address'), '$') ::varchar as address,
get(xmlget(supplierinfo, 'City'), '$')::varchar as city,
get(xmlget(supplierinfo, 'PostalCode'), '$')::varchar as PostalCode,
get(xmlget(supplierinfo, 'Country'), '$')::varchar as country,
get(xmlget(supplierinfo, 'Phone'), '$')::varchar as phone

from {{ref("stg_suppliers")}}