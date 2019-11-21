{%- block instantiate_transverse_mass %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_trans_mass_{{ o1.type }}_{{ o2.type }}_bx_{{ o1.object_handle.bx_offset }}_bx_{{ o2.object_handle.bx_offset }}_i: entity work.transverse_mass
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_PT_VECTOR_WIDTH, {{ o2.type|upper }}_PT_VECTOR_WIDTH,
            {{ o1.type|upper }}_{{ o2.type|upper }}_COSH_COS_VECTOR_WIDTH,
            {{ o1.type|upper }}_{{ o2.type|upper }}_COSH_COS_PRECISION
        )
        port map(
            conv.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).pt_vector,
            conv.{{ o2.type }}(bx({{ o2.object_handle.bx_offset }})).pt_vector,
            cos_dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            trans_mass_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }}))
       );
{% endblock instantiate_transverse_mass %}
{# eof #}
