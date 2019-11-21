{%- block instantiate_comparator_eta_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set index = comparator.objects[0].index %}
    comp_eta_{{ o1.type|lower }}_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_ETA_WIDTH,
            ETA, X"{{ o1.LowerLimit|X04 }}", X"{{ o1.UpperLimit|X04 }}", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).eta, comp_eta_{{ o1.type|lower }}_{{ index }}
        );
{% endblock instantiate_comparator_eta_cut %}
{# eof #}
