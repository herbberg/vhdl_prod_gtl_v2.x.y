{%- block instantiate_comparators_muon_charge_corr_double %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_muon_cc_double_{{ index }}_i: entity work.comparators_muon_charge_corr
        generic map(
            double, CC_{{ condition.chargeCorrelation|upper }}
        )
        port map(
            lhc_clk, 
            cc_double => cc_double(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), 
            comp_o_double => cc_double_{{ index_comp_cc_double }}
        );
{% endblock instantiate_comparators_muon_charge_corr_double %}
{# eof #}
