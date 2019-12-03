{%- block instantiate_cos_dphi_lut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_cos_dphi_{{ o1.type }}_{{ o2.type }}_bx_{{ o1.bx_raw }}_bx_{{ o2.bx_raw }}_i: entity work.cos_dphi_lut
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t)
        )
        port map(
            dphi_calc_{{ o1.type }}_{{ o2.type }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            cos_dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }}))
        );
{% endblock instantiate_cos_dphi_lut %}
