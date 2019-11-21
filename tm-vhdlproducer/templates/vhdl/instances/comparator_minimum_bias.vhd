{%- block instantiate_comparator_minimum_bias %}
  {%- set o1 = comparator.objects[0] %}
  {%- set index = comparator.objects[0].index %}
    comp_{{ o1.type|lower }}_{{ index }}_i: entity work.comparators_obj_cuts
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
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).count, comp_count_{{ o1.type|lower }}_{{ index }}
        );
{% endblock instantiate_comparator_minimum_bias %}
{# eof #}
