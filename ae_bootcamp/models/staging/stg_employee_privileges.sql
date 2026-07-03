with source as (
    select * from {{ source('northwind','employee_privileges') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   