{%- block instantiate_comparator_towercount %}
  {%- set o1 = comparator.objects[0] %}
  {%- set index = comparator.objects[0].index %}
    comp_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.threshold|X04 }}_i: entity work.comparators_obj_cuts
        generic map(
            N_TOWERCOUNT_OBJECTS, TOWERCOUNT_COUNT_WIDTH,
  {% if o1.operator == true %}  
            GE, 
  {% else %}  
            EQ, 
  {% endif %}  
             X"{{ o1.threshold|X04 }}", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.{{ o1.type|lower }}(bx({{ o1.bx }})).count, comp_{{ o1.type|lower }}_bx{{ o1.bx }}_0x{{ o1.threshold|X04 }}
        );
{% endblock instantiate_comparator_towercount %}
{# eof #}
