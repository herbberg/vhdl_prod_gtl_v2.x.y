{%- block instantiate_comparator_deta_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_deta_{{ o1.type|lower }}_{{ o2.type|lower }}__index_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DETA_VECTOR_WIDTH, deltaEta, 
            X"{{ condition.deltaEta.lower|X13 }}", X"{{ condition.deltaEta.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            deta_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx }}),bx({{ o2.bx }})), deta_{{ o1.type|lower }}_{{ o2.type|lower }}__index }}
        );
{% endblock instantiate_comparator_deta_cut %}
{# eof #}
