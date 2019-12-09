{%- block instantiate_comparator_dphi_cut %}
    comp_dphi_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_0x{{ limit_l|lower }}_0x{{ limit_u|lower }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ obj1|upper }}_OBJECTS, N_{{ obj2|upper }}_OBJECTS, ({{ obj1|lower }}_t,{{ obj2|lower }}_t),
            {{ obj1|upper }}_{{ obj2|upper }}_DPHI_VECTOR_WIDTH, deltaPhi, 
            X"{{ limit_l|upper }}", X"{{ limit_u|upper }}"        
        )
        port map(
            lhc_clk, 
            dphi_{{ obj1|lower }}_{{ obj2|lower }}(bx({{ bx_raw1 }}),bx({{ bx_raw2 }})), comp_deta_{{ obj1|lower }}_{{ obj2|lower }}_bx_{{ bx1 }}_bx_{{ bx2 }}_0x{{ limit_l|lower }}_0x{{ limit_u|lower }}
        );
{%- endblock instantiate_comparator_dphi_cut %}
