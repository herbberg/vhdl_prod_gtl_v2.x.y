{%- block instantiate_comparators_muon_charge_corr_double %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_cc_double_bx{{ o1.object_handle.bx_offset }}_bx{{ o2.object_handle.bx_offset }}_cc_{{ condition.chargeCorrelation|lower }}_i: entity work.comparators_muon_charge_corr
        generic map(
            double, CC_{{ condition.chargeCorrelation|upper }}
        )
        port map(
            lhc_clk, 
            cc_double => cc_double(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), 
            comp_o_double => comp_cc_double_bx{{ o1.object_handle.bx_offset }}_bx{{ o2.object_handle.bx_offset }}_cc_{{ condition.chargeCorrelation|lower }}
        );
{% endblock instantiate_comparators_muon_charge_corr_double %}
{# eof #}
