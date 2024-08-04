{{ 
    config(
        alias = 'int_projects',
        materialized='table'
    )
}}

select
    project.sylvera_id
    , project.project_name
    , project.registry_name
    , project.country
    , project.category
    , project.subcategory
    , project.retired_total
    , project.permitted_total
    , project.offset_type
    , ratings.rating
    , ratings.rating_date
    , (
        select high_float 
        from {{ ref('stg_pricing') }} as p
        where 1 = 1
            and project.sylvera_id = p.sylvera_id
        order by
            priced_at desc
            , high_float desc 
        limit 1
    ) as latest_pricing
from {{ ref('stg_projects') }} as project
    left join{{ ref('stg_ratings') }} as ratings
        on project.sylvera_id = ratings.sylvera_id
