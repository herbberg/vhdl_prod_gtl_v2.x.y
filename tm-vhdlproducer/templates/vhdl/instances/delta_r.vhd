{%- block instantiate_delta_r %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_delta_r_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx_raw }}_bx_{{ o2.bx_raw }}_i: entity work.delta_r
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t)
        )
        port map(
            deta_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            dphi_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            dr_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }}))
        );
{%- endblock instantiate_delta_r %}
{# eof #}
