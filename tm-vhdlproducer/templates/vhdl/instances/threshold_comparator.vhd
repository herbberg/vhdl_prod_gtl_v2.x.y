{%- block instantiate_muon_charge_correlations %}
  {%- set o1 = condition.objects[0] %}
    comp_threshold_{{ index1 }}_i: entity work.threshold_comparator
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_{{ o1.cut_handle.cut_type|upper }}_WIDTH,
            {{ o1.operator|upper }}, X"{{ o1.threshold|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx(0)).{{ o1.cut_handle.cut_type }}, {{ o1.cut_handle.cut_type }}_{{ o1.type|upper }}_{{ index2 }}
        );
{% endblock instantiate_muon_charge_correlations %}
{# eof #}
