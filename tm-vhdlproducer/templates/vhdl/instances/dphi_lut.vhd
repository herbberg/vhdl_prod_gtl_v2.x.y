{%- block instantiate_dphi_lut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_dphi_lut_{{ o1.type }}_{{ o2.type }}_bx_{{ o1.object_handle.bx_offset }}_bx_{{ o2.object_handle.bx_offset }}_i: entity work.dphi_lut
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t)
        )
        port map(
            dphi_calc_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_dphi_lut %}
{# eof #}
