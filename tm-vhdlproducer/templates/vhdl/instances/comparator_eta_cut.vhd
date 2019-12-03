{%- block instantiate_comparator_eta_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_eta_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.etaCuts[0][0]|X04 }}_0x_{{ o1.etaCuts[0][1]|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_ETA_WIDTH,
            ETA, X"{{ o1.etaCuts[0][0]|X04 }}", X"{{ o1.etaCuts[0][1]|X04 }}", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).eta, comp_eta_{{ o1.type|lower }}_bx_{{ o1.bx }}_0x{{ o1.etaCuts[0][0]|X04 }}_0x{{ o1.etaCuts[0][1]|X04 }}
        );
{% endblock instantiate_comparator_eta_cut %}
