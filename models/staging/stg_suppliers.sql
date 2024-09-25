{{config(materialized='table', schema='staging')}}
select * from {{ source('qwt_src', 'Suppliers') }}
