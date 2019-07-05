{%- block instantiate_muon_charge_correlations %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_sub_eta_{{ index }}_i: entity work.sub_eta
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS
        )
        port map(
            conv.{{ o1.type }}(bx(o1.object_handle.bx_offset }})).eta,
            conv.{{ o2.type }}(bx(o2.object_handle.bx_offset }})).eta,
            sub_eta_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_muon_charge_correlations %}
{# eof #}

