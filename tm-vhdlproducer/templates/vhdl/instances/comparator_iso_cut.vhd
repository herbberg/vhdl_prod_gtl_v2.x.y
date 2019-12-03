{%- block instantiate_comparator_iso_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_iso_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.isolationLUT|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_ISO_WIDTH,
            ISO, X"0000", X"0000", X"{{ o1.isolationLUT|X04 }}", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).iso, comp_iso_{{ o1.type|lower }}_bx_{{ o1.bx }}_0x{{ o1.isolationLUT|X04 }}
        );
{% endblock instantiate_comparator_iso_cut %}
