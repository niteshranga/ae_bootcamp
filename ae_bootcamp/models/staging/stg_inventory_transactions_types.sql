with source as (
    select * from {{ source('northwind','inventory_transaction_types') }}
)
select *, {{get_ingestion_timestamp()}} 
 from source   