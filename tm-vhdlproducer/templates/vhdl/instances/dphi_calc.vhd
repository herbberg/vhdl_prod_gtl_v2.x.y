{%- block instantiate_dphi_calc %}
    calc_dphi_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_i: entity work.dphi_calc
        generic map(
            N_{{ obj1|upper }}_OBJECTS, N_{{ obj2|upper }}_OBJECTS, ({{ obj1|lower }}_t,{{ obj2|lower }}_t)
        )
        port map(
            conv.{{ obj1|lower }}(bx({{ bx1 }})).phi,
            conv.{{ obj2|lower }}(bx({{ bx2 }})).phi,
            dphi_calc_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1 }}),bx({{ bx2 }}))
        );
{%- endblock instantiate_dphi_calc %}
