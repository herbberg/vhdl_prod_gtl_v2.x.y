{%- block instantiate_comparator_pt_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_pt_{{ o1.type|lower }}__index_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_PT_WIDTH,
            {{ o1.operator|upper }}, X"{{ o1.threshold|X04 }}", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).pt, pt_{{ o1.type|lower }}__index
        );
{% endblock instantiate_comparator_pt_cut %}
{# eof #}
