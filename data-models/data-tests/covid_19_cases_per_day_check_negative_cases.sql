--checking for negative cases
select * from {{ref('covid_19_cases_per_day')}} where cases < 0