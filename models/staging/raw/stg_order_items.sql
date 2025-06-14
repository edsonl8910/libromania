with source as (
    select * from raw.order_items
),

renamed as (
    select
        order_id,
        book_id,
        quantity,
        unit_price
    from source
)

select * from renamed
