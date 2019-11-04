{%- block instantiate_dphi_calc %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_dphi_{{ index }}_i: entity work.dphi_calc
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t)
        )
        port map(
            conv.{{ o1.type }}(bx(o1.object_handle.bx_offset }})).phi,
            conv.{{ o2.type }}(bx(o2.object_handle.bx_offset }})).phi,
            dphi_calc_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_dphi_calc %}
{# eof #}

