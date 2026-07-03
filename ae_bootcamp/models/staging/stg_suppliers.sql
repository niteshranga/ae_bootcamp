with source as (
    select * from {{ source('northwind','suppliers') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source 