with books as (
    select * from {{ ref('stg_books') }}
)

select
    book_id,
    title,
    author,
    genre,
    price,
	CURRENT_DATE AS fec_carga
from books




