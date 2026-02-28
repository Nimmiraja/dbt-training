{{macro limit(columnname)}}
{%target.name='development'%}
where {{columnname}}>dateadd(day,-30,current_timestamp)
{% endif %}
{{endmacro}}