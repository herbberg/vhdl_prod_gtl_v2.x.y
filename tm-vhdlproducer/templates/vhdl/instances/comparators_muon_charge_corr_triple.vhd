{%- block instantiate_comparators_muon_charge_corr_triple %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_muon_cc_triple_{{ index }}_i: entity work.comparators_muon_charge_corr
        generic map(
            triple, CC_{{ condition.chargeCorrelation|upper }}
        )
        port map(
            lhc_clk, 
            cc_triple => cc_triple(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), 
            comp_o_triple => cc_triple_{{ index }}
        );
{% endblock instantiate_comparators_muon_charge_corr_triple %}
{# eof #}
