{{ 
    config(
        alias = 'stg_projects',
        materialized='table'
    )
}}

with source_data as (

    select
        sylvera_id
        , name as project_name
        , registry_name
        , country
        , category
        , subcategory
        , retired_total
        , permitted_total
        , offset_type
    from {{ source('project', 'projects')}}

)

select
    sylvera_id
    , project_name
    , registry_name
    , country
    , category
    , subcategory
    , retired_total
    , permitted_total
    , offset_type
from source_data
