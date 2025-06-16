select
    user_name,
    count(*) as num_queries,
    round(sum(credits_used_cloud_services), 4) as credits_consumed
from {{ ref('fct_query_costs') }}
group by user_name
order by credits_consumed desc