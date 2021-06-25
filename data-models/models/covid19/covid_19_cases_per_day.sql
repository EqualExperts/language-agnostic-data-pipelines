{{ config(materialized='view') }}

    select day,
    COALESCE((payload#>>'{0,newCases}')::int,0) as cases 
    from {{ ref('covid_19_ingestion') }}