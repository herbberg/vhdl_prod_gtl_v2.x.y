{%- block instantiate_transverse_mass %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx_raw }}_bx_{{ o2.bx_raw }}_i: entity work.transverse_mass
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_PT_VECTOR_WIDTH, {{ o2.type|upper }}_PT_VECTOR_WIDTH,
            {{ o1.type|upper }}_{{ o2.type|upper }}_COSH_COS_VECTOR_WIDTH,
            {{ o1.type|upper }}_{{ o2.type|upper }}_COSH_COS_PRECISION
        )
        port map(
            conv.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).pt_vector,
            conv.{{ o2.type|lower }}(bx({{ o2.bx_raw }})).pt_vector,
            cos_dphi_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }}))
       );
{%- endblock instantiate_transverse_mass %}
{# eof #}
