with source as (
    select * from raw.payments
),

renamed as (
    select
        payment_id,
        order_id,
        payment_date,
        amount,
        method
    from source
)

select * from renamed
