with source as (
    select * from {{ source('northwind','products') }} where supplier_ids not like "%;%"
),
altered as (
    select 
    cast(supplier_ids as integer) as supplier_id,
    id,
    product_code,
    product_name,
    description,
    standard_cost,
    list_price,
    reorder_level,
    target_level,
    quantity_per_unit,
    discontinued,
    minimum_reorder_quantity,
    category,
    attachments
    from source
)
select *, {{get_ingestion_timestamp()}} 
 from altered   