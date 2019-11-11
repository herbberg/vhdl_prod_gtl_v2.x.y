{%- block instantiate_correlation_conditions %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    cond_{{ condition.vhdl_signal }}_i: entity work.correlation_conditions
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS,
            (({{ o1.sliceLow }},{{ o1.sliceHigh }}), ({{ o2.sliceLow }},{{ o2.sliceHigh }}), (0,0), (0,0)),
  {%- if condition.chargeCorrelation in ('os', 'ls') %}
            true
  {%- else %}
            false
  {%- endif %}
        )
        port map(
            lhc_clk, comb_{{ o1.type|lower|lower }}__index_comb1, comb_{{ o2.type|lower|lower }}__index_comb2,           
  {%- if condition.deltaEta.enabled == "true" %} 
            deta => deta_{{ o1.type|lower }}_{{ o2.type|lower }}__index,         
  {%- endif %}            
  {%- if condition.deltaPhi.enabled == "true" %} 
            dphi => dphi_{{ o1.type|lower }}_{{ o2.type|lower }}__index,        
  {%- endif %}            
  {%- if condition.deltaR.enabled == "true" %} 
            delta_r => dr_{{ o1.type|lower }}_{{ o2.type|lower }}__index,        
  {%- endif %}            
  {%- if condition.mass.enabled == "true" %} 
    {%- if condition.mass.type == 0 %} 
            inv_mass => inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}__index,
    {%- endif %}            
    {%- if condition.mass.type == 1 %} 
            trans_mass => trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}__index,
    {%- endif %}
  {%- endif %}
  {%- if condition.twoBodyPt.enabled == "true" %} 
            tbpt => tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}__index,     
  {%- endif %}            
  {%- if condition.chargeCorrelation in ('os', 'ls') %}
            charge_corr_double => cc_double__index,
  {%- endif %}
            cond_o => {{ condition.vhdl_signal }}
        );
{% endblock instantiate_correlation_conditions %}
{# eof #}
