{%- block instantiate_comparator_dr_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_dr_{{ index }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DELTAR_VECTOR_WIDTH, deltaR, 
            X"{{ condition.deltaR.lower|X13 }}", X"{{ condition.deltaR.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            dr_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), dr_{{ o1.type }}_{{ o2.type }}_{{ index_comp_dr }}
        );
{% endblock instantiate_comparator_dr_cut %}
{# eof #}
