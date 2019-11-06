{%- block instantiate_comparator_tbpt_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_tbpt_{{ compTwoBodyPt.objectTypes.index }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_TBPT_VECTOR_WIDTH, twoBodyPt, 
            X"{{ condition.twoBodyPt.lower|X13 }}"        
        )
        port map(
            lhc_clk, 
            tbpt_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), tbpt_{{ o1.type }}_{{ o2.type }}_{{ compTwoBodyPt.objectTypes.index }}
        );
{% endblock instantiate_comparator_tbpt_cut %}
{# eof #}
