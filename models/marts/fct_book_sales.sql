with book_sales as (
    select * from {{ ref('int_book_sales') }}
)

select
    book_id,
    title,
    genre,
    total_quantity,
    gross_revenue,
    total_paid,
	CURRENT_DATE AS fec_carga
from book_sales
