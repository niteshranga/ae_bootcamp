{{config(
    partition_by={
        "field": "order_date",
        "data_type": "date"
    }
)}}
with source as (
    select 
        d.order_id,
        d.product_id,
        o.customer_id,
        o.employee_id,
        o.shipper_id,
        d.quantity,
        d.unit_price,
        d.discount,
        d.status_id,
        d.date_allocated,
        d.purchase_order_id,
        d.inventory_id,
        date(o.order_date) as order_date,
        o.shipped_date,
        o.paid_date,
        current_timestamp() as ingestion_timestamp
    from {{ref('stg_order_details')}} d
    left join {{ref('stg_orders')}} o
    on o.id = d.id
    where d.order_id is not null
),
unique_source as(
    select *,
    row_number() over (partition by order_id, product_id, customer_id, employee_id, shipper_id, purchase_order_id,
     order_date) as row_number
    from source
)
select *
except (row_number),
from unique_source
where row_number = 1