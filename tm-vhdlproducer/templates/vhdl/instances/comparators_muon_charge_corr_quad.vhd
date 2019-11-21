{%- block instantiate_comparators_muon_charge_corr_quad %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_cc_quad_bx{{ o1.object_handle.bx_offset }}_bx{{ o2.object_handle.bx_offset }}_cc_{{ condition.chargeCorrelation|lower }}_i: entity work.comparators_muon_charge_corr
        generic map(
            quad, CC_{{ condition.chargeCorrelation|upper }}
        )
        port map(
            lhc_clk, 
            cc_quad => cc_quad(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), 
            comp_o_quad => comp_cc_quad_bx{{ o1.object_handle.bx_offset }}_bx{{ o2.object_handle.bx_offset }}_cc_{{ condition.chargeCorrelation|lower }}
        );
{% endblock instantiate_comparators_muon_charge_corr_quad %}
{# eof #}
