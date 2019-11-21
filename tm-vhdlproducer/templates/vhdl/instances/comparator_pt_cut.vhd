{%- block instantiate_comparator_pt_cut %}
  {%- set o1 = comparator.objects[0] %}
  {%- set index = comparator.objects[0].index %}
    comp_pt_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.threshold|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_PT_WIDTH,
  {% if o1.operator == true %}  
            GE, 
  {% else %}  
            EQ, 
  {% endif %}  
            X"{{ o1.threshold|X04 }}", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).pt, comp_pt_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.threshold|X04 }}
        );
{% endblock instantiate_comparator_pt_cut %}
{# eof #}
