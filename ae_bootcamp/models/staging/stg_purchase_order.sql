with source as (
    select * from {{ source('northwind','purchase_orders') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   