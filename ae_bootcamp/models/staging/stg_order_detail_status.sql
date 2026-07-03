with source as (
    select * from {{ source('northwind','order_details_status') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   