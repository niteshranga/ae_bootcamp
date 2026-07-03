with source as (
    select * from {{ source('northwind','order_details') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   