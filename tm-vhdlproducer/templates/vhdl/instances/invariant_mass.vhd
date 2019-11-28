{%- block instantiate_invariant_mass %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx_raw }}_bx_{{ o2.bx_raw }}_i: entity work.invariant_mass
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_PT_VECTOR_WIDTH, {{ o2.type|upper }}_PT_VECTOR_WIDTH,
            {{ o1.type|upper }}_{{ o2.type|upper }}_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).pt_vector,
            conv.{{ o2.type|lower }}(bx({{ o2.bx_raw }})).pt_vector,
            cosh_deta_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            cos_dphi_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }}))
       );
{%- endblock instantiate_invariant_mass %}
{# eof #}
