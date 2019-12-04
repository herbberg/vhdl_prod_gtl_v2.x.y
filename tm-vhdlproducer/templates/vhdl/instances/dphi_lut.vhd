{%- block instantiate_dphi_lut %}
    calc_dphi_lut_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_i: entity work.dphi_lut
        generic map(
            N_{{ obj1|upper }}_OBJECTS, N_{{ obj2|upper }}_OBJECTS, ({{ obj1|lower }}_t,{{ obj2|lower }}_t)
        )
        port map(
            dphi_calc_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1 }}),bx({{ bx2 }})),
            dphi_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1 }}),bx({{ bx2 }}))
        );
{%- endblock instantiate_dphi_lut %}
