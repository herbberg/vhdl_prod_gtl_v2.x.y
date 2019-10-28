{%- block instantiate_twobody_pt %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_twobody_pt_{{ index }}_i: entity work.twobody_pt
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS
            {{ o1.type|upper }}_PT_VECTOR_WIDTH, {{ o2.type|upper }}_PT_VECTOR_WIDTH
        )
        port map(
            conv.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).pt_vector,
            conv.{{ o2.type }}(bx({{ o2.object_handle.bx_offset }})).pt_vector,
            conv.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).cos_phi,
            conv.{{ o2.type }}(bx({{ o2.object_handle.bx_offset }})).cos_phi,
            conv.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).sin_phi,
            conv.{{ o2.type }}(bx({{ o2.object_handle.bx_offset }})).sin_phi,
            tbpt_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }}))
       );
{% endblock instantiate_twobody_pt %}
{# eof #}
