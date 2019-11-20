{%- block instantiate_comparator_charge_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_charge_{{ o1.type|lower }}__index_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_QUAL_WIDTH,
            CHARGE, X"0000", X"0000", X"0000", "{{ o1.charge }}"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).charge, charge_{{ o1.type|lower }}__index
        );
{% endblock instantiate_comparator_charge_cut %}
{# eof #}
