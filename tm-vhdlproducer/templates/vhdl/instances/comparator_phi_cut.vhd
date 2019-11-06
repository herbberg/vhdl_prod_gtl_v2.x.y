{%- block instantiate_comparator_phi_cut %}
  {%- set o1 = condition.objects[0] %}
    comp_phi_{{ compPhi.objectType.index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_PHI_WIDTH,
            PHI, X"{{ o1.LowerLimit|X04 }}", X"{{ o1.UpperLimit|X04 }}"
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).phi, phi_{{ o1.type|upper }}_{{ compPhi.objectType.index }}
        );
{% endblock instantiate_comparator_phi_cut %}
{# eof #}
