{%- block instantiate_muon_charge_correlations %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_diff_phi_{{ index }}_i: entity work.diff_phi_lut
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t)
        )
        port map(
            sub_phi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_muon_charge_correlations %}
{# eof #}
