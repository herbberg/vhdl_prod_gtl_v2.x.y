{%- block instantiate_comparator_inv_mass_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set o2 = comparator.objects[1] %}
    comp_inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ comparator.objects[0].objects[1].index.lower|X13 }}_0x{{ comparator.objects[0].objects[1].index.upper|X13 }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_MASS_VECTOR_WIDTH, mass, 
            X"{{ comparator.objects[0].objects[1].index.lower|X13 }}", X"{{ comparator.objects[0].objects[1].index.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx }}),bx({{ o2.bx }})), comp_inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ comparator.objects[0].objects[1].index.lower|X13 }}_0x{{ comparator.objects[0].objects[1].index.upper|X13 }}
        );
{% endblock instantiate_comparator_inv_mass_cut %}
{# eof #}
