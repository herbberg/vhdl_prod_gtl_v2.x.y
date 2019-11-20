{%- block instantiate_comparator_asymmetry %}
  {%- set o1 = condition.objects[0] %}
    comp_{{ o1.type|lower }}_index_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_WIDTH,
            {{ o1.operator|upper }}, X"{{ o1.threshold|X04 }}", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).count, count_{{ o1.type|lower }}_index
        );
{% endblock instantiate_comparator_asymmetry %}
{# eof #}
