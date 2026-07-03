with source as (
    select * from {{ source('northwind','orders') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   