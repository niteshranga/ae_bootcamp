with source as (
    select * from {{ source('northwind','inventory_transactions') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   