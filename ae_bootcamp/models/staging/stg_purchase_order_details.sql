with source as (
    select * from {{ source('northwind','purchase_order_details') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   