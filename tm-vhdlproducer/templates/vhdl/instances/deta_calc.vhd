{%- block instantiate_deta_calc %}
    calc_deta_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_i: entity work.deta_calc
        generic map(
            N_{{ obj1|upper }}_OBJECTS, N_{{ obj2|upper }}_OBJECTS, ({{ obj1|lower }}_t,{{ obj2|lower }}_t)
        )
        port map(
            conv.{{ obj1|lower }}(bx({{ bx1 }})).eta,
            conv.{{ obj2|lower }}(bx({{ bx2 }})).eta,
            deta_calc_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1 }}),bx({{ bx2 }}))
        );
{%- endblock instantiate_deta_calc %}
