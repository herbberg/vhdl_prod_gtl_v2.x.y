{%- block instantiate_signal_condition %}
  {%- set o = condition.objects[0] %}
    {%- if o.is_signal_type  %}
{{ condition.vhdl_signal }} <= centrality(centrality.bit)(bx({{ o1.object_handle.bx_offset }}));
    {%- endif %}
{% endblock instantiate_signal_condition %}
{# eof #}
