{% set table_name = ref('covid_19_cases_per_day') %}
 
{% set input %}
insert into covid_19_ingestion(day, payload) values ('2021-05-05', '[{}]');
insert into covid_19_ingestion(day, payload) values ('2021-05-06','[{"newCases": 20}]');
{% endset %}
 
{% set expectations %}
select '2021-05-05'::timestamp as day, 0 as cases
union all
select '2021-05-06'::timestamp as day, 20 as cases
{% endset %}
 
{{ unit_test(table_name, input, expectations) }}
