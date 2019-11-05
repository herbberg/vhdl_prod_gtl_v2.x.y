{%- block instantiate_comparator_eta_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_eta_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_ETA_WIDTH,
            {{ o1.operator|upper }}, X"{{ o1.LowerLimit|X04 }}", X"{{ o1.UpperLimit|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).eta, eta_{{ o1.type|upper }}_{{ index_comp_eta }}
        );
{% endblock instantiate_comparator_eta_cut %}
{# eof #}
