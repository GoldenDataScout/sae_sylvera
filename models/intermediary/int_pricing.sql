{{ 
    config(
        alias = 'int_pricing',
        materialized='table'
    )
}}

select
    pricing.sylvera_id
    , pricing.priced_at
    , pricing.high_float
    , pricing.low_float
    , pricing.vintage
    , project.project_name
    , project.registry_name
    , project.country
    , project.category
    , project.subcategory
    , project.offset_type
    , ratings.rating
    , ratings.rating_date
from {{ ref('stg_pricing') }} as pricing
    left join {{ ref('stg_projects') }} as project
        on pricing.sylvera_id = project.sylvera_id
    left join {{ ref('stg_ratings') }} as ratings
        on pricing.sylvera_id = ratings.sylvera_id
