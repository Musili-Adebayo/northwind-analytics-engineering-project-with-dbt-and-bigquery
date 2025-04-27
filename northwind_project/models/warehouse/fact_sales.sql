{{ config(
    partition_by={
        'field': 'order_date',
        'data_type': 'date'
    }
 ) }}
with source as (
    select
        od.id as order_id
        , od.product_id
        , o.employee_id
        , o.customer_id
        , o.shipper_id
        , od.quantity
        , od.unit_price
        , od.discount
        , od.status_id
        , od.date_allocated
        , od.purchase_order_id
        , od.inventory_id
        , o.shipped_date
        , o.paid_date
        , date(o.order_date) as order_date
        , current_timestamp() as insertion_timestamp
    from {{ ref('stg_orders') }} as o
    left join {{ ref('stg_order_details') }} as od
        on o.id = od.order_id
    where o.order_id is not null
)

, unique_source as (
    select
        *
        , row_number() over (
            partition by employee_id, customer_id, order_id, product_id, purchase_order_id, shipper_id, order_date
        ) as row_number
    from source
)

select
    *
    except (row_number)
from unique_source
where row_number = 1
