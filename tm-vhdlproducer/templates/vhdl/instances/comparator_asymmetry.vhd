{%- block instantiate_comparator_asymmetry %}
  {%- set o1 = comparator.object %}
  {%- set index = comparator.object.index %}
    comp_count_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.threshold|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_WIDTH,
  {% if o1.operator == true %}  
            GE, 
  {% else %}  
            EQ, 
  {% endif %}  
             X"{{ o1.threshold|X04 }}", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).count, comp_count_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.threshold|X04 }}
        );
{% endblock instantiate_comparator_asymmetry %}
{# eof #}
