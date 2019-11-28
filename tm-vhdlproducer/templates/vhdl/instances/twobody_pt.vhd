{%- block instantiate_twobody_pt %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_twobody_pt_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx_raw }}_bx_{{ o2.bx_raw }}_i: entity work.twobody_pt
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS
            {{ o1.type|upper }}_PT_VECTOR_WIDTH, {{ o2.type|upper }}_PT_VECTOR_WIDTH
        )
        port map(
            conv.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).pt_vector,
            conv.{{ o2.type|lower }}(bx({{ o2.bx_raw }})).pt_vector,
            conv.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).cos_phi,
            conv.{{ o2.type|lower }}(bx({{ o2.bx_raw }})).cos_phi,
            conv.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).sin_phi,
            conv.{{ o2.type|lower }}(bx({{ o2.bx_raw }})).sin_phi,
            tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }}))
       );
{%- endblock instantiate_twobody_pt %}
{# eof #}
