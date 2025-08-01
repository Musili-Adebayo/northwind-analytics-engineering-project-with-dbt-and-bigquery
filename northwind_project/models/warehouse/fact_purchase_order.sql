{{ config(
    partition_by={
        'field': 'creation_date',
        'data_type': 'date'
    }
 ) }}
with source as (
    select
        c.id as customer_id
        , e.id as employee_id
        , pod.purchase_order_id
        , pod.product_id
        , pod.quantity
        , pod.unit_cost
        , pod.date_received
        , pod.posted_to_inventory
        , pod.inventory_id
        , po.supplier_id
        , po.created_by
        , po.submitted_date
        , po.status_id
        , po.expected_date
        , po.shipping_fee
        , po.taxes
        , po.payment_date
        , po.payment_amount
        , po.payment_method
        , po.notes
        , po.approved_by
        , po.approved_date
        , po.submitted_by
        , date(po.creation_date) as creation_date
        , current_timestamp() as insertion_timestamp
    from {{ ref('stg_purchase_orders') }} as po
    left join {{ ref('stg_purchase_order_details') }} as pod
        on po.id = pod.purchase_order_id
    left join {{ ref('stg_products') }} as p
        on pod.product_id = p.id
    left join {{ ref('stg_order_details') }} as od
        on p.id = od.product_id
    left join {{ ref('stg_orders') }} as o
        on od.order_id = o.id
    left join {{ ref('stg_employees') }} as e
        on po.created_by = e.id
    left join {{ ref('stg_customer') }} as c
        on o.customer_id = c.id
    where c.customer_id is not null
)

, unique_source as (
    select
        *
        , row_number() over (
            partition by
                customer_id
                , employee_id
                , purchase_order_id
                , product_id
                , product_id
                , inventory_id
                , supplier_id
                , creation_date
        ) as row_number
    from source
)

select
    *
    except (row_number)
from unique_source
where row_number = 1
