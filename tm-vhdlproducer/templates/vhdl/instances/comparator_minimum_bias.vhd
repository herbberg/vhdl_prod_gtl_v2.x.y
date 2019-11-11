{%- block instantiate_comparator_minimum_bias %}
  {%- set o1 = condition.objects[0] %}
    comp_{{ o1.type|lower }}__index_i: entity work.comparators_obj_cuts
        generic map(
            1, MB_COUNT_WIDTH,
            COUNT, X"{{ o1.threshold|X01 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).count, {{ o1.type|lower }}__index
        );
{% endblock instantiate_comparator_minimum_bias %}
{# eof #}
