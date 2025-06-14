with customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        birth_date,
        {{ calculate_age('birth_date') }} as age,
		CURRENT_DATE AS fec_carga
    from customers
)

select * from final
