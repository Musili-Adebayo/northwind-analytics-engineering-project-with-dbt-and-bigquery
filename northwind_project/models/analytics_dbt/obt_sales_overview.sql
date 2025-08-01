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
        , s.order_id
        , s.shipper_id
        , s.quantity
        , s.unit_price
        , s.discount
        , s.status_id
        , s.date_allocated
        , s.purchase_order_id
        , s.inventory_id
        , s.order_date
        , s.shipped_date
        , s.paid_date
        , current_timestamp() as insertion_timestamp
    from {{ ref('fact_sales') }} as s
    left join {{ ref('dim_customer') }} as c
        on s.customer_id = c.customer_id
    left join {{ ref('dim_employees') }} as e
        on s.employee_id = e.employee_id
    left join {{ ref('dim_product') }} as p
        on s.product_id = p.product_id
)

select *
from source
