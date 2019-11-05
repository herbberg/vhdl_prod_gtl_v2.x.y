{%- block instantiate_comparators_obj_cuts %}
  {%- set o1 = condition.objects[0] %}
    comp_{{ o1.cut_handle.cut_type }}_{{ index }}_i: entity work.comparators_obj_cuts
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ o1.type|upper }}_{{ o1.cut_handle.cut_type|upper }}_WIDTH,
  {%- if o1.cut_handle.cut_type == "pt" %}
            {{ o1.operator|upper }}, X"{{ o1.threshold|X04 }}"
  {%- elif o1.cut_handle.cut_type == "charge" %}
            {{ o1.operator|upper }}, X"0000", X"0000", X"0", "{{ o1.charge }}"
  {%- elif o1.cut_handle.cut_type == "iso" %}
            {{ o1.operator|upper }}, X"0000", X"0000", X"{{ o1.isolationLUT|X04 }}"
  {%- elif o1.cut_handle.cut_type == "qual" %}
            {{ o1.operator|upper }}, X"0000", X"0000", X"{{ o1.qualityLUT|X04 }}"
  {%- else %}
            {{ o1.operator|upper }}, X"{{ o1.LowerLimit|X04 }}", X"{{ o1.UpperLimit|X04 }}"
  {%- endif %}
        )
        port map(
            lhc_clk, data.{{ o1.type }}(bx({{ o1.object_handle.bx_offset }})).{{ o1.cut_handle.cut_type }}, {{ o1.cut_handle.cut_type }}_{{ o1.type|upper }}_{{ index }}
        );
{% endblock instantiate_comparators_obj_cuts %}
{# eof #}
