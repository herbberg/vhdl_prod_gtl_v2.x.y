{%- block instantiate_cos_dphi_lut %}
    calc_cos_dphi_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_i: entity work.cos_dphi_lut
        generic map(
            N_{{ obj1|upper }}_OBJECTS, N_{{ obj2|upper }}_OBJECTS, ({{ obj1 }}_t,{{ obj2 }}_t)
        )
        port map(
            dphi_calc_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1_raw }}),bx({{ bx2_raw }})),
            cos_dphi_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1_raw }}),bx({{ bx2_raw }}))
        );
{%- endblock instantiate_cos_dphi_lut %}
