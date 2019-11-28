{%- block instantiate_muon_charge_correlations %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_muon_charge_correlations_bx_{{ o1.bx_raw }}_bx_{{ o2.bx_raw }}_i: entity work.muon_charge_correlations
        port map(
            data.muon(bx({{ o1.bx_raw }})).charge,
            data.muon(bx({{ o2.bx_raw }})).charge,
            cc_double(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            cc_triple(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }})),
            cc_quad(bx({{ o1.bx_raw }}),bx({{ o2.bx_raw }}))
        );
{% endblock instantiate_muon_charge_correlations %}
