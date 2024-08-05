{{ 
    config(
        alias = 'stg_ratings',
        materialized='table'
    ) }}

with source_data as (

    select
        sylvera_id
        , rating
        , rating as rating_date
    from {{ source('project', 'ratings')}}

)

select
    sylvera_id
    , rating
    , rating_date
from source_data
