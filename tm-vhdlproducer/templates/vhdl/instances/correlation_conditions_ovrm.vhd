{%- block instantiate_correlation_conditions_ovrm %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
  {%- set o3 = condition.objects[2] %}
    cond_{{ condition.vhdl_signal }}_i: entity work.correlation_conditions_ovrm
        generic map(
  {%- if o1.type == o2.type %}  
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS,  N_{{ o3.type|upper }}_OBJECTS
            (({{ o1.sliceLow }},{{ o1.sliceHigh }}), ({{ o2.sliceLow }},{{ o2.sliceHigh }}), ({{ o3.sliceLow }},{{ o3.sliceHigh }}), (0,0)),
  {%- else %}  
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o1.type|upper }}_OBJECTS,  N_{{ o2.type|upper }}_OBJECTS
            (({{ o1.sliceLow }},{{ o1.sliceHigh }}), ({{ o1.sliceLow }},{{ o1.sliceHigh }}), ({{ o2.sliceLow }},{{ o2.sliceHigh }}), (0,0)),  
  {%- endif %}
  {%- if condition.chargeCorrelation in ('os', 'ls') %}
            true,
  {%- else %}
            false,
  {%- endif %}
  {%- if o1.type == o2.type %}  
            true,
  {%- else %}  
            false,
  {%- endif %}
        )
        port map(
            lhc_clk, 
  {%- if o1.type == o2.type %}  
            comb_{{ o1.type|lower }}__index_comb1, comb_{{ o2.type|lower }}__index_comb2, comb_{{ o3.type }}__index_comb3,            
  {%- else %}  
            comb_{{ o1.type|lower }}__index_comb1, comb_{{ o1.type|lower }}__index_comb1, comb_{{ o2.type }}__index_comb3,            
  {%- endif %}
  {%- if condition.deltaEta.enabled == "true"  %}
            deta => deta_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_deta,         
  {%- endif %}            
  {%- if condition.deltaPhi.enabled == "true"  %}
            dphi => dphi_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_dphi,        
  {%- endif %}            
  {%- if condition.deltaR.enabled == "true"  %}
            delta_r => dr_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_dr,        
  {%- endif %}            
  {%- if condition.mass.enabled == "true"  %}
    {%- if condition.mass.type == 0 %}
            inv_mass => inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_inv_mass,
    {%- endif %}            
    {%- if condition.mass.type == 1 %}
            trans_mass => trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_trans_mass,
    {%- endif %}
  {%- endif %}
  {%- if condition.twoBodyPt.enabled == "true" %}
            tbpt => tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_tbpt,     
  {%- endif %}            
  {%- if condition.chargeCorrelation in ('os', 'ls') %}
            charge_corr_double => cc_double__index_comp_cc_double,
  {%- endif %}
  {%- if o1.type == o2.type %}  
    {%- if condition.deltaEtaOrm.enabled == "true" %}
            deta_ovrm => deta_{{ o1.type|lower }}_{{ o3.type|lower }}__index_comp_deta,         
    {%- endif %}
    {%- if condition.deltaPhiOrm.enabled == "true" %}
            dphi_ovrm => dphi_{{ o1.type|lower }}_{{ o3.type|lower }}__index_comp_dphi,         
    {%- endif %}
    {%- if condition.deltaROrm.enabled == "true" %}
            dr_ovrm => dr_{{ o1.type|lower }}_{{ o3.type|lower }}__index_comp_dr,        
    {%- endif %}            
  {%- else %}  
    {%- if condition.deltaEtaOrm.enabled == "true" %}
            deta_ovrm => deta_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_deta,         
    {%- endif %}
    {%- if condition.deltaPhiOrm.enabled == "true" %}
            dphi_ovrm => dphi_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_dphi,         
    {%- endif %}
    {%- if condition.deltaROrm.enabled == "true" %}
            dr_ovrm => dr_{{ o1.type|lower }}_{{ o2.type|lower }}__index_comp_dr,        
    {%- endif %}            
  {%- endif %}
            cond_o => {{ condition.vhdl_signal }}
        );
{% endblock instantiate_correlation_conditions_ovrm %}
{# eof #}
