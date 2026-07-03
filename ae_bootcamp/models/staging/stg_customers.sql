with source as (
    select * from {{source('northwind','customer')}}
)
select *, {{get_ingestion_timestamp()}} 
 from source   