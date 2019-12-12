{%- block instantiate_invariant_mass %}
    calc_inv_mass_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_i: entity work.invariant_mass
        generic map(
            N_{{ obj1|upper }}_OBJECTS, N_{{ obj2|upper }}_OBJECTS, ({{ obj1|lower }}_t,{{ obj2|lower }}_t),
            {{ obj1|upper }}_PT_VECTOR_WIDTH, {{ obj2|upper }}_PT_VECTOR_WIDTH,
            {{ obj1|upper }}_{{ obj2|upper }}_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.{{ obj1|lower }}(bx({{ bx1_raw }})).pt_vector,
            conv.{{ obj2|lower }}(bx({{ bx2_raw }})).pt_vector,
            cosh_deta_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1_raw }}),bx({{ bx2_raw }})),
            cos_dphi_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1_raw }}),bx({{ bx2_raw }})),
            invmass_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx1_raw }}),bx({{ bx2_raw }}))
       );
{%- endblock instantiate_invariant_mass %}
