{%- block instantiate_sub_eta %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_sub_eta_{{ index }}_i: entity work.sub_eta
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o1.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t)
        )
        port map(
            conv.{{ o1.type }}(bx(o1.object_handle.bx_offset }})).eta,
            conv.{{ o2.type }}(bx(o2.object_handle.bx_offset }})).eta,
            sub_eta_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_sub_eta %}
{# eof #}

