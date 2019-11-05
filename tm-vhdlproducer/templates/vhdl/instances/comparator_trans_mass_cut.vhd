{%- block instantiate_comparator_trans_mass_cut %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    comp_trans_mass_{{ index }}_i: entity work.comparators_corr_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_MASS_VECTOR_WIDTH, mass, 
            X"{{ condition.mass.lower|X13 }}", X"{{ condition.mass.upper|X13 }}"        
        )
        port map(
            lhc_clk, 
            trans_mass_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), trans_mass_{{ o1.type }}_{{ o2.type }}_{{ index_comp_trans_mass }}
        );
{% endblock instantiate_comparator_trans_mass_cut %}
{# eof #}
