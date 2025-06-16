with queries as (
    select
        query_id,
        user_name,
        start_time,
        end_time,
        warehouse_name,
        query_text,
        total_elapsed_time/1000.0 as execution_time_seconds,
        credits_used_cloud_services
    from snowflake.account_usage.query_history
    where start_time >= dateadd('day', -7, current_timestamp())
      and query_type = 'SELECT'
      and database_name = 'DB_LIBROMANIA'
)

select *
from queries
order by start_time desc
