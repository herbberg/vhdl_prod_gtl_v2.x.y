{%- block instantiate_comparator_deta_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_deta_{{ compDeta.objectTypes.index }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DETA_VECTOR_WIDTH, deltaEta, 
            X"{{ condition.deltaEta.lower|X13 }}", X"{{ condition.deltaEta.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            deta_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), deta_{{ o1.type }}_{{ o2.type }}_{{ compDeta.objectTypes.index }}
        );
{% endblock instantiate_comparator_deta_cut %}
{# eof #}
