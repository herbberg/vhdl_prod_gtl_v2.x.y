{%- block instantiate_comparator_iso_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set index = comparator.objects[0].index %}
    comp_iso_{{ o1.type|lower }}_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_ISO_WIDTH,
            ISO, X"0000", X"0000", X"{{ o1.isolationLUT|X04 }}", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).iso, comp_iso_{{ o1.type|lower }}_{{ index }}
        );
{% endblock instantiate_comparator_iso_cut %}
{# eof #}
