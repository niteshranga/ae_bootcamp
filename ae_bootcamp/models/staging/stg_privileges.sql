with source as (
    select * from {{ source('northwind','privileges') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   