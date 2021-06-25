{% macro extract_columns(query) %}

{% set results = run_query(query) %}

{% if execute %}
  {%- for column in results.columns -%}
  {{column.name}}
  {%- if not loop.last -%}
  ,
  {%- endif -%}
  {% endfor %}
{%- endif -%}

{% endmacro %}

{% macro unit_test(table_name, input, expectations) %}
{% set input_query = run_query(input) %}
{% set columns = extract_columns(expectations) %}
{% set test_sql %}
with
expectations as ({{ expectations }}),

expectations_with_count as (select *, count(*) from expectations group by {{columns}}),

actual as (select {{columns}}, count(*) from {{ table_name }} group by {{columns}}),

extra_entries as (
select '+' as diff, count, {{columns}} from actual 
except
select '+' as diff, count, {{columns}} from expectations_with_count),

missing_entries as (
select '-' as diff, count, {{columns}} from expectations_with_count
except
select '-' as diff, count, {{columns}} from actual)
 
select * from extra_entries
UNION ALL 
select * from missing_entries
{% endset %}

{% if execute %}
  {% set results = run_query(test_sql) %}
  {% set results_length = results.rows|length %}
  {% if results_length > 0 %}
    {% do results.print_table(max_columns=None, max_column_width=30) %}
  {% endif %}
  select 1 where {{ results_length }} != 0  
{% endif %}
{% endmacro %}