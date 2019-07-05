{%- block instantiate_muon_charge_correlations %}
  {%- set o1 = condition.objects[0] %}
    comp_range_{{ index1 }}_i: entity work.range_comparator
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_{{ o1.cut_handle.cut_type|upper }}_WIDTH,
            {{ o1.cut_handle.cut_type|upper }}, X"{{ o1.UpperLimit|X04 }}", X"{{ o1.LowerLimit|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx(0)).{{ o1.cut_handle.cut_type }}, {{ o1.cut_handle.cut_type }}_{{ o1.type|upper }}_{{ index2 }}
        );
{% endblock instantiate_muon_charge_correlations %}
{# eof #}
