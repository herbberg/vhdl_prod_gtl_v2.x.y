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
            lhc_clk,           
  {%- if o1.type == 'EG' or 'JET' or 'TAU' %}
  {%- with obj = condition.objects[0] %}
            comb_1 => {% include  "helper/helper_comb_and_calos_signals_names.txt" %}
  {%- endwith %}
  {%- elif o1.type == 'MU' %}
  {%- with obj = condition.objects[0] %}
            comb_1 => {% include  "helper/helper_comb_and_muons_signals_names.txt" %}
  {%- endwith %}
  {%- endif %}
  {%- if o2.type == 'EG' or 'JET' or 'TAU' %}
  {%- with obj = condition.objects[1] %}
            comb_2 => {% include  "helper/helper_comb_and_calos_signals_names.txt" %}
  {%- endwith %}
  {%- elif o2.type == 'MU' %}
  {%- with obj = condition.objects[1] %}
            comb_2 => {% include  "helper/helper_comb_and_muons_signals_names.txt" %}
  {%- endwith %}
  {%- endif %}
  {%- if condition.deltaEta.enabled == "true" %} 
            deta => comp_deta_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.deltaEta.lower|X13 }}_0x{{ condition.deltaEta.upper|X13 }},         
  {%- endif %}            
  {%- if condition.deltaPhi.enabled == "true" %} 
            dphi => comp_dphi_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.deltaPhi.lower|X13 }}_0x{{ condition.deltaPhi.upper|X13 }},        
  {%- endif %}            
  {%- if condition.deltaR.enabled == "true" %} 
            delta_r => comp_dr_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.deltaR.lower|X13 }}_0x{{ condition.deltaR.upper|X13 }},        
  {%- endif %}            
  {%- if condition.mass.enabled == "true" %} 
    {%- if condition.mass.type == 0 %} 
            inv_mass => comp_inv_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.mass.lower|X13 }}_0x{{ condition.mass.upper|X13 }},
    {%- endif %}            
    {%- if condition.mass.type == 1 %} 
            trans_mass => comp_trans_mass_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.mass.lower|X13 }}_0x{{ condition.mass.upper|X13 }},
    {%- endif %}
  {%- endif %}
  {%- if condition.twoBodyPt.enabled == "true" %} 
            tbpt => comp_tbpt_{{ o1.type|lower }}_{{ o2.type|lower }}_bx_{{ o1.bx }}_bx_{{ o2.bx }}_0x{{ condition.twoBodyPt.lower|X13 }},     
  {%- endif %}            
  {%- if condition.chargeCorrelation in ('os', 'ls') %}
            charge_corr_double => comp_cc_double_bx_{{ o1.bx }}_bx_{{ o2.bx }}_{{ condition.chargeCorrelation }},
  {%- endif %}
            cond_o => {{ condition.vhdl_signal }}
        );
{% endblock instantiate_correlation_conditions %}
