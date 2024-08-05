{{ 
    config(
        alias = 'core_projects',
        materialized='view', 
    )
}}

select *
from {{ ref('int_projects') }}
