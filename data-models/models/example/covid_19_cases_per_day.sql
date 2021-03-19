{{ config(materialized='view') }}


    select day, payload#>'{0,newCases}' 
    from covid_19_ingestion