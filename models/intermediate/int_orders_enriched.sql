with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

orders_with_customers as (
    select
        o.order_id,
        o.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        c.birth_date,
        o.order_date,
        o.status
    from orders o
    left join customers c
        on o.customer_id = c.customer_id
),

payments_agg as (
    select
        order_id,
        sum(amount) as total_paid
    from payments
    group by order_id
)

select
    o.*,
    p.total_paid
from orders_with_customers o
left join payments_agg p
    on o.order_id = p.order_id
