{%- block instantiate_combinatorial_conditions_esums %}
  {%- set o1 = condition.objects[0] %}
    cond_{{ condition.vhdl_signal }}_i: entity work.combinatorial_conditions
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, 1,
            ((0,0), (0,0), (0,0), (0,0)), 
            false
        )
        port map(
            lhc_clk, 
            comb_1 => comb_a,
            cond_o => {{ condition.vhdl_signal }}
        );
{% endblock instantiate_combinatorial_conditions_esums %}
{# eof #}
