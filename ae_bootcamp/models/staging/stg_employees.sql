with source as (
    select * from {{ source('northwind','employees') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   