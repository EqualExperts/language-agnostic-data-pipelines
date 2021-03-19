{{ config(materialized='view') }}


    select day, COALESCE(payload#>'{0,newCases}',0) as cases 
    from covid_19_ingestion