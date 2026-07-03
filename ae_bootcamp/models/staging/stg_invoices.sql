with source as (
    select * from {{ source('northwind','invoices') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   