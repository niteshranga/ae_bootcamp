{% macro get_ingestion_timestamp() %}
       current_timestamp() as ingestion_timestamp
   {% endmacro %}