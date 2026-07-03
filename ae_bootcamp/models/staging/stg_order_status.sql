with source as (
    select * from {{ source('northwind','orders_status') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   