with source as (
    select * from {{ source('northwind','strings') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   