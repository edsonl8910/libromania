with order_items as (
    select * from {{ ref('stg_order_items') }}
),

books as (
    select * from {{ ref('stg_books') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

payments_agg as (
    select
        order_id,
        sum(amount) as total_paid
    from payments
    group by order_id
),

combined as (
    select
        oi.book_id,
        b.title,
        b.author,
        b.genre,
        b.price,
        sum(oi.quantity) as total_quantity,
        sum(oi.quantity * oi.unit_price) as gross_revenue,
        sum(pa.total_paid) as total_paid
    from order_items oi
    join books b on oi.book_id = b.book_id
    left join payments_agg pa on oi.order_id = pa.order_id
    group by oi.book_id, b.title, b.author, b.genre, b.price
)

select * from combined
