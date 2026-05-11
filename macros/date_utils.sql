{% macro get_season(p_date_column) %}
CASE
WHEN MONTH(TO_TIMESTAMP({{p_date_column}})) in (12,1,2)
  THEN 'WINTER'
WHEN MONTH(TO_TIMESTAMP({{p_date_column}})) in (3,4,5)
  THEN 'SPRING'
WHEN MONTH(TO_TIMESTAMP({{p_date_column}})) in (6,7,8)
  THEN 'SUMMER'
WHEN MONTH(TO_TIMESTAMP({{p_date_column}})) in (9,10,11)
  THEN 'AUTOMN'
END
{% endmacro %}

{% macro get_day_type(p_date_column) %}
CASE
WHEN DAYNAME(TO_TIMESTAMP({{p_date_column}})) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END
{% endmacro %}