{%- block instantiate_correlation_conditions %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
    cond_{{ condition.vhdl_signal }}_i: entity work.correlation_conditions
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS,
            (({{ o1.sliceLow }},{{ o1.sliceHigh }}), ({{ o2.sliceLow }},{{ o2.sliceHigh }}), (0,0), (0,0)),
  {%- if {{ condition.chargeCorrelation }} in ('os', 'ls') %}
            true,
  {%- else %}
            false,
  {%- endif %}
            {{ condition.twoPlusOne }}
        )
        port map(
            lhc_clk, comb_{{ o1.type }}_{{ index_comb1 }}, comb_{{ o2.type }}_{{ index_comb2 }},           
  {%- if {{ condition.deltaEta.enabled }} %}
            deta => deta_{{ o1.type }}_{{ o2.type }}_{{ index_comp_deta }},         
  {%- endif %}            
  {%- if {{ condition.deltaPhi.enabled }} %}
            dphi => dphi_{{ o1.type }}_{{ o2.type }}_{{ index_comp_dphi }},        
  {%- endif %}            
  {%- if {{ condition.deltaR.enabled }} %}
            delta_r => dr_{{ o1.type }}_{{ o2.type }}_{{ index_comp_dr }},        
  {%- endif %}            
  {%- if {{ condition.mass.enabled }} %}
    {%- if {{ condition.mass.type == 0 }} %}
            inv_mass => inv_mass_{{ o1.type }}_{{ o2.type }}_{{ index_comp_inv_mass }},
    {%- endif %}            
    {%- if {{ condition.mass.type == 1 }} %}
            trans_mass => trans_mass_{{ o1.type }}_{{ o2.type }}_{{ index_comp_trans_mass }},
    {%- endif %}
  {%- if {{ condition.twoBodyPt.enabled }} %}
            tbpt => tbpt_{{ o1.type }}_{{ o2.type }}_{{ index_comp_tbpt }},     
  {%- endif %}            
  {%- if {{ condition.chargeCorrelation }} in ('os', 'ls') %}
            charge_corr_double => cc_double_{{ index_comp_cc_double }},
  {%- endif %}
            cond_o => {{ condition.vhdl_signal }}
        );
{% endblock instantiate_correlation_conditions %}
{# eof #}
