{%- block instantiate_comparator_dphi_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set o2 = comparator.objects[1] %}
    comp_dphi_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ comparator.objects[0].objects[1].index.lower|X13 }}_0x{{ comparator.objects[0].objects[1].index.upper|X13 }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DPHI_VECTOR_WIDTH, deltaPhi, 
            X"{{ comparator.objects[0].objects[1].index.lower|X13 }}", X"{{ comparator.objects[0].objects[1].index.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            dphi_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx }}),bx({{ o2.bx }})), comp_dphi_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ comparator.objects[0].objects[1].index.lower|X13 }}_0x{{ comparator.objects[0].objects[1].index.upper|X13 }}
        );
{% endblock instantiate_comparator_dphi_cut %}
{# eof #}
