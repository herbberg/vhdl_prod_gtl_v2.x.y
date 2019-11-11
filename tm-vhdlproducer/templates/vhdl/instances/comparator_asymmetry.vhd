{%- block instantiate_comparator_asymmetry %}
  {%- set o1 = condition.objects[0] %}
    comp_{{ o1.type|lower }}_{{ compCount.objectType.index }}_i: entity work.comparators_obj_cuts
        generic map(
            1, ASYM_WIDTH,
            COUNT, X"{{ o1.threshold|X02 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).count, {{ o1.type|lower }}__index
        );
{% endblock instantiate_comparator_asymmetry %}
{# eof #}
