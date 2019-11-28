{%- block instantiate_comparator_dr_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set o2 = comparator.objects[1] %}
    comp_dr_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ comparator.objects[0].objects[1].index.lower|X13 }}_0x{{ comparator.objects[0].objects[1].index.upper|X13 }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DELTAR_VECTOR_WIDTH, deltaR, 
            X"{{ comparator.objects[0].objects[1].index.lower|X13 }}", X"{{ comparator.objects[0].objects[1].index.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            dr_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})), comp_dr_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ comparator.objects[0].objects[1].index.lower|X13 }}_0x{{ comparator.objects[0].objects[1].index.upper|X13 }}
        );
{% endblock instantiate_comparator_dr_cut %}
{# eof #}
