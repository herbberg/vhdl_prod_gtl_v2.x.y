{%- block instantiate_comparator_phi_cut %}
  {%- set o1 = comparator.objects[0] %}
    comp_phi_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.LowerLimit|X04 }}_0x{{ o1.UpperLimit|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_PHI_WIDTH,
            PHI, X"{{ o1.LowerLimit|X04 }}", X"{{ o1.UpperLimit|X04 }}", X"0000", "ign" 
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).phi, comp_phi_{{ o1.type|lower }}_bx_{{ o1.bx }}_0x{{ o1.LowerLimit|X04 }}_0x{{ o1.UpperLimit|X04 }}
        );
{% endblock instantiate_comparator_phi_cut %}
{# eof #}
