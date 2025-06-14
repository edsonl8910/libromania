with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

payments_agg as (
    select
        order_id,
        sum(amount) as total_amount_paid,
        count(*) as num_payments
    from payments
    group by order_id
),

items_agg as (
    select
        order_id,
        sum(quantity) as total_items,
        sum(quantity * unit_price) as total_order_value
    from order_items
    group by order_id
),

fct as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        coalesce(p.total_amount_paid, 0) as total_paid,
        coalesce(p.num_payments, 0) as num_payments,
        coalesce(i.total_items, 0) as total_items,
        coalesce(i.total_order_value, 0) as total_order_value,
		CURRENT_DATE AS fec_carga
    from orders o
    left join payments_agg p on o.order_id = p.order_id
    left join items_agg i on o.order_id = i.order_id
)

select * from fct
