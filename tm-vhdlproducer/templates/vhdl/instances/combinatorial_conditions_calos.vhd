{%- block instantiate_combinatorial_conditions_calos %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
  {%- set o3 = condition.objects[2] %}
  {%- set o4 = condition.objects[3] %}
    cond_{{ condition.vhdl_signal }}_i: entity work.combinatorial_conditions
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, {{ condition.nr_objects }},
            (({{ o1.sliceLow }},{{ o1.sliceHigh }}), ({{ o2.sliceLow }},{{ o2.sliceHigh }}), ({{ o3.sliceLow }},{{ o3.sliceHigh }}), ({{ o4.sliceLow }},{{ o4.sliceHigh }})),
            false
        )
        port map(
            lhc_clk, 
            comb_1 => comb_a,
  {%- if condition.nr_objects  == 2 %}
            comb_2 => comb_b,
  {%- elif condition.nr_objects  == 3 %}
            comb_2 => comb_b,
            comb_3 => comb_c,
  {%- elif condition.nr_objects  == 4 %}
            comb_2 => comb_b,
            comb_3 => comb_c,
            comb_4 => comb_d,
  {%- endif %}
  {%- if condition.twoBodyPt.enabled == "true" %}
            tbpt => tbpt_{{ o1.type|lower }}_{{ o1.type|lower }}__index_comp_tbpt,        
  {%- endif %}
            cond_o => {{ condition.vhdl_signal }}
        );
{% endblock instantiate_combinatorial_conditions_calos %}
{# eof #}
