{%- block instantiate_comparator_asymmetry %}
  {%- set o1 = condition.objects[0] %}
    comp_asym_{{ compCount.objectType.index }}_i: entity work.comparators_obj_cuts
        generic map(
            1, ASYM_WIDTH,
            COUNT, X"{{ o1.threshold|X02 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).count, {{ o1.type }}_{{ compCount.objectType.index }}
        );
{% endblock instantiate_comparator_asymmetry %}
{# eof #}
