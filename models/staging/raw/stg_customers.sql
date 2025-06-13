with source as (
    select * from raw.customers
),

renamed as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        birth_date
    from source
)

select * from renamed
