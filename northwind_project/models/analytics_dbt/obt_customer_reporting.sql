with source as (
    select
        c.customer_id
        , c.company as customer_company
        , c.last_name as customer_last_name
        , c.first_name as customer_first_name
        , c.email_address as customer_email_address
        , c.job_title as customer_job_title
        , c.business_phone as customer_business_phone
        , c.home_phone as customer_home_phone
        , c.mobile_phone as customer_mobile_phone
        , c.fax_number as customer_fax_number
        , c.address as customer_address
        , c.city as customer_city
        , c.state_province as customer_state_province
        , c.zip_postal_code as customer_zip_postal_code
        , c.country_region as customer_country_region
        , c.web_page as customer_web_page
        , c.notes as customer_notes
        , c.attachments as customer_attachments
        , e.employee_id
        , e.company as employee_company
        , e.last_name as employee_last_name
        , e.first_name as employee_first_name
        , e.email_address as employee_email_address
        , e.job_title as employee_job_title
        , e.business_phone as employee_business_phone
        , e.home_phone as employee_home_phone
        , e.mobile_phone as employee_mobile_phone
        , e.fax_number as employee_fax_number
        , e.address as employee_address
        , e.city as employee_city
        , e.state_province as employee_state_province
        , e.zip_postal_code as employee_zip_postal_code
        , e.country_region as employee_country_region
        , e.web_page as employee_web_page
        , e.notes as employee_notes
        , e.attachments as employee_attachments
        , p.product_id
        , p.product_code
        , p.product_name
        , p.description
        , p.supplier_company
        , p.standard_cost
        , p.list_price
        , p.reorder_level
        , p.target_level
        , p.quantity_per_unit
        , p.discontinued
        , p.minimum_reorder_quantity
        , p.category
        , p.attachments
        , po.purchase_order_id
        , po.quantity
        , po.unit_cost
        , po.date_received
        , po.posted_to_inventory
        , po.inventory_id
        , po.supplier_id
        , po.created_by
        , po.submitted_date
        , po.creation_date
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
        , current_timestamp() as insertion_timestamp
    from {{ ref('fact_purchase_order') }} as po
    left join {{ ref('dim_customer') }} as c
        on c.customer_id = po.customer_id
    left join {{ ref('dim_employees') }} as e
        on e.employee_id = po.employee_id
    left join {{ ref('dim_product') }} as p
        on p.product_id = po.product_id
)

select *
from source
