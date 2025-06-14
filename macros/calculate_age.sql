{% macro calculate_age(date_field) %}
    timestampdiff(year, {{ date_field }}, current_date)
{% endmacro %}