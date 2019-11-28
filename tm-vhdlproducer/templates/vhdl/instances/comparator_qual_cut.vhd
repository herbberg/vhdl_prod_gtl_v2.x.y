{%- block instantiate_comparator_qual_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_qual_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.qualityLUT|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_QUAL_WIDTH,
            QUAL, X"0000", X"0000", X"{{ o1.qualityLUT|X04 }}", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx_raw }})).qual, comp_qual_{{ o1.type|lower }}_bx_{{ o1.bx }}_0x{{ o1.qualityLUT|X04 }}
        );
{% endblock instantiate_comparator_qual_cut %}
{# eof #}
