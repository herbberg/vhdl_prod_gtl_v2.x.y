{%- block instantiate_comparator_pt_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_pt_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_PT_WIDTH,
            {{ o1.operator|upper }}, X"{{ o1.threshold|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).pt, pt_{{ o1.type|upper }}_{{ index_comp_pt }}
        );
{% endblock instantiate_comparator_pt_cut %}
{# eof #}
