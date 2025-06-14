SELECT *
FROM {{ ref('dim_customers') }}
WHERE age < 30
