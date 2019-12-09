{%- block instantiate_comparator_muon_charge_corr_double %}
    comp_cc_double_bx_{{ bx1 }}_bx_{{ bx2 }}_cc_{{ cc_val|lower }}_i: entity work.comparators_muon_charge_corr
        generic map(
            double, CC_{{ cc_val|upper }}
        )
        port map(
            lhc_clk, 
            cc_double => cc_double(bx({{ bx_raw1 }}),bx({{ bx_raw2 }})), 
            comp_o_double => comp_cc_double_bx_{{ bx1 }}_bx_{{ bx2 }}_cc_{{ cc_val|lower }}
        );
{%- endblock instantiate_comparator_muon_charge_corr_double %}
