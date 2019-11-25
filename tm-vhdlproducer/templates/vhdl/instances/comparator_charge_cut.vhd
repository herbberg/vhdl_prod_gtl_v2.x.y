{%- block instantiate_comparator_charge_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set index = comparator.objects[0].index %}
    comp_charge_{{ o1.type|lower }}_bx{{ o1.bx }}_{{ o1.charge }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_CHARGE_WIDTH,
            CHARGE, X"0000", X"0000", X"0000", "{{ o1.charge }}"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).charge, comp_charge_{{ o1.type|lower }}_bx{{ o1.bx }}_{{ o1.charge }}
        );
{% endblock instantiate_comparator_charge_cut %}
{# eof #}
