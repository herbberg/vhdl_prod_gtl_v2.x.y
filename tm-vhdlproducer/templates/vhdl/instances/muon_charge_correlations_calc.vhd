{%- block instantiate_muon_charge_correlations_calc %}
    calc_muon_charge_correlations_bx_{{ bx1 }}_bx_{{ bx2 }}_i: entity work.muon_charge_correlations
        port map(
            data.mu(bx({{ bx1_raw }})).charge,
            data.mu(bx({{ bx2_raw }})).charge,
            cc_double(bx({{ bx1_raw }}),bx({{ bx2_raw }})),
            cc_triple(bx({{ bx1_raw }}),bx({{ bx2_raw }})),
            cc_quad(bx({{ bx1_raw }}),bx({{ bx2_raw }}))
        );
{%- endblock instantiate_muon_charge_correlations_calc %}
