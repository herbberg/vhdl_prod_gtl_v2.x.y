{%- block instantiate_condition_trans_mass_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx{{ o1.bx }}_bx{{ o2.bx }}_0x{{ condition.objects[0].objects[1].index.lower|X13 }}_0x{{ condition.objects[0].objects[1].index.upper|X13 }}_i: entity work.conditions_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_MASS_VECTOR_WIDTH, mass, 
            X"{{ condition.objects[0].objects[1].index.lower|X13 }}", X"{{ condition.objects[0].objects[1].index.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})), comp_trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.objects[0].objects[1].index.lower|X13 }}_0x{{ condition.objects[0].objects[1].index.upper|X13 }}
        );
{% endblock instantiate_condition_trans_mass_cut %}
