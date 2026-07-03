with source as (
    select * from {{ source('northwind','products') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   