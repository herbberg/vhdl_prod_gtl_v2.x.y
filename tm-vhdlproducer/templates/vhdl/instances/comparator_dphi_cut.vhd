{%- block instantiate_comparator_dphi_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_dphi_{{ o1.type|lower }}_{{ o2.type|lower }}__index_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type|lower }}_t,{{ o2.type|lower }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DPHI_VECTOR_WIDTH, deltaPhi, 
            X"{{ condition.deltaPhi.lower|X13 }}", X"{{ condition.deltaPhi.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            dphi_{{ o1.type|lower }}_{{ o2.type|lower }}(bx({{ o1.bx }}),bx({{ o2.bx }})), dphi_{{ o1.type|lower }}_{{ o2.type|lower }}__index
        );
{% endblock instantiate_comparator_dphi_cut %}
{# eof #}
