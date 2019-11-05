{%- block instantiate_comparator_iso_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_iso_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_ISO_WIDTH,
            {{ o1.operator|upper }}, X"0000", X"0000", X"{{ o1.isolationLUT|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).iso, iso_{{ o1.type|upper }}_{{ index_comp_iso }}
        );
{% endblock instantiate_comparator_iso_cut %}
{# eof #}
