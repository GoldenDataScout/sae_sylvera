{{ 
    config(
        alias = 'stg_pricing',
        materialized='table'
    ) }}

with source_data as (

    select
        sylvera_id
        , priced_at
        , high_float
        , low_float
        , vintage
    from {{ source('project', 'pricing')}}

)

, cleaned_source as (
    select
        sylvera_id
        , priced_at
        , high_float
        , low_float
        , vintage
        , row_number() over (partition by sylvera_id, vintage, priced_at order by high_float desc) as seq
    from source_data
    where 1 = 1

)

select
    
    sylvera_id
    , priced_at
    , high_float
    , low_float
    , vintage

from cleaned_source
where 1 = 1
    and seq = 1
