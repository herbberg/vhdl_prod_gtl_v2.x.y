{%- block instantiate_muon_charge_correlations %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    calc_muon_charge_correlations_bx_{{ o1.object_handle.bx_offset }}_bx_{{ o2.object_handle.bx_offset }}_i: entity work.muon_charge_correlations
        port map(
            data.muon(bx({{ o1.object_handle.bx_offset }})).charge,
            data.muon(bx({{ o2.object_handle.bx_offset }})).charge,
            cc_double(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            cc_triple(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})),
            cc_quad(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }}))
        );
{% endblock instantiate_muon_charge_correlations %}
{# eof #}
