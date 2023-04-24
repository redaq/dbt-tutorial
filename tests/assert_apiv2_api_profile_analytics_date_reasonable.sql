with api_profile as (
    select * from {{ref('target_api_profile_analytics')}}
)

select 
    count(*)
from api_profile
where date_of_birth::date < '900-01-01'::date