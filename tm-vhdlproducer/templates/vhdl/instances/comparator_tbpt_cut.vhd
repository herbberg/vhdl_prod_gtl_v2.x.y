{%- block instantiate_comparator_tbpt_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}__index_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_TBPT_VECTOR_WIDTH, twoBodyPt, 
            X"{{ condition.twoBodyPt.lower|X13 }}"        
        )
        port map(
            lhc_clk, 
            tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx }}),bx({{ o2.bx }})), tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}__index
        );
{% endblock instantiate_comparator_tbpt_cut %}
{# eof #}
