with source as (
    select * from raw.books
),

renamed as (
    select
        book_id,
        title,
        author,
        price,
        genre
    from source
)

select * from renamed
