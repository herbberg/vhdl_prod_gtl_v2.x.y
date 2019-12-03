{%- block instantiate_comparator_deta_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_deta_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ condition.deltaEta.lower|X13 }}_0x{{ condition.deltaEta.upper|X13 }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DETA_VECTOR_WIDTH, deltaEta, 
            X"{{ condition.deltaEta.lower|X13 }}", X"{{ condition.deltaEta.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            deta_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})), comp_deta_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.deltaEta.lower|X13 }}_0x{{ condition.deltaEta.upper|X13 }}
        );
{% endblock instantiate_comparator_deta_cut %}
