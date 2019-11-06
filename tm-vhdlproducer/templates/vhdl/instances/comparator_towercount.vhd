{%- block instantiate_comparator_towercount %}
  {%- set o1 = condition.objects[0] %}
    comp_pt_{{ compCount.objectType.index }}_i: entity work.comparators_obj_cuts
        generic map(
            1, TOWERCOUNT_COUNT_WIDTH,
            COUNT, X"{{ o1.threshold|X04 }}"
        )
        port map(
            lhc_clk, data.towercount(bx({{ o1.object_handle.bx_offset }})).count, towercount_{{ compCount.objectType.index }}
        );
{% endblock instantiate_comparator_towercount %}
{# eof #}
