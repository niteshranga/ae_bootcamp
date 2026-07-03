with source as (
    select * from {{ source('northwind','shippers') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   