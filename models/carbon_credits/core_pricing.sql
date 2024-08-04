{{ 
    config(
        alias = 'core_pricing',
        materialized='view', 
    )
}}

select *
from {{ ref('int_pricing') }}
