import os

tables = ["employee_privileges","employee_privilages","privileges","privilates","transaction_types","shippers","suppliers",
          "order_tax_status","order_status","purchase_order","purchase_order_details","purchase_order_status",
          "inventory_transactions","inventory_transactions_types","invoices","order_detail_status","order_details","strings"]

for table in tables:
    content = f"""with source as (
    select * from {{{{ source('northwind','{table}') }}}}
)
select * from source"""
    
    with open(f"models/staging/stg_{table}.sql", "w") as f:
        f.write(content)