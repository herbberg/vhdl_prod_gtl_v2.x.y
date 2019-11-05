{%- block instantiate_comparator_qual_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_qual_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_QUAL_WIDTH,
            {{ o1.operator|upper }}, X"0000", X"0000", X"{{ o1.qualityLUT|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).qual, qual_{{ o1.type|upper }}_{{ index_comp_qual }}
        );
{% endblock instantiate_comparator_qual_cut %}
{# eof #}
