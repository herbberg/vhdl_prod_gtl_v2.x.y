{%- block instantiate_comparator_dphi_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_dphi_{{ compDphi.objectTypes.index }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_DPHI_VECTOR_WIDTH, deltaPhi, 
            X"{{ condition.deltaPhi.lower|X13 }}", X"{{ condition.deltaPhi.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), dphi_{{ o1.type }}_{{ o2.type }}_{{ compDphi.objectTypes.index }}
        );
{% endblock instantiate_comparator_dphi_cut %}
{# eof #}
