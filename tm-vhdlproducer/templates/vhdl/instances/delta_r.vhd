{%- block instantiate_delta_r %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_delta_r_{{ index_calc_delta_r }}_i: entity work.delta_r
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t)
        )
        port map(
            deta_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            dr_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_delta_r %}
{# eof #}
