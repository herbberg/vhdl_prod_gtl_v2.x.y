{%- block instantiate_comb_and %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
  {%- set o3 = condition.objects[2] %}
  {%- set o4 = condition.objects[3] %}
-- ********************************
-- Test:
-- pt: {{ o1.threshold|X04 }}
-- etaW1: {{ o1.etaW1LowerLimit|X04 }} {{ o1.etaW1UpperLimit|X04 }}
-- etaW2: {{ o1.etaW2LowerLimit|X04 }} {{ o1.etaW2UpperLimit|X04 }}
-- etaW3: {{ o1.etaW3LowerLimit|X04 }} {{ o1.etaW3UpperLimit|X04 }}
-- etaW4: {{ o1.etaW4LowerLimit|X04 }} {{ o1.etaW4UpperLimit|X04 }}
-- etaW5: {{ o1.etaW5LowerLimit|X04 }} {{ o1.etaW5UpperLimit|X04 }}
-- phiW1: {{ o1.phiW1LowerLimit|X04 }} {{ o1.phiW1UpperLimit|X04 }}
-- phiW2: {{ o1.phiW2LowerLimit|X04 }} {{ o1.phiW2UpperLimit|X04 }}
-- iso: {{ o1.isolationLUT|X04 }}
-- qual: {{ o1.qualityLUT|X04 }}
-- charge: {{ o1.charge }}
-- count: {{ o1.count|X04 }}
-- ********************************
  {%- if condition.nr_objects > 0 %}  
    {%- if o1.etaNrCuts == 0 and o1.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_pt_{{ o1.threshold|X04 }} <= comp_pt_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_0x{{ o1.threshold|X04 }};
    {%- elif o1.etaNrCuts == 1 and o1.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_pt_{{ o1.threshold|X04 }}_eta_{{ o1.etaW1LowerLimit|X04 }}_{{ o1.etaW1UpperLimit|X04 }} <= comp_pt_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_0x{{ o1.threshold|X04 }} and comp_eta_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_0x{{ o1.etaW1LowerLimit|X04 }}_0x{{ o1.etaW1UpperLimit|X04 }};
    {%- elif o1.etaNrCuts == 2 and o1.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_pt_{{ o1.threshold|X04 }}_eta_{{ o1.etaW1LowerLimit|X04 }}_{{ o1.etaW1UpperLimit|X04 }}_{{ o1.etaW2LowerLimit|X04 }}_{{ o1.etaW2UpperLimit|X04 }} <= comp_pt_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_0x{{ o1.threshold|X04 }} and (comp_eta_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_0x{{ o1.etaW1LowerLimit|X04 }}_0x{{ o1.etaW1UpperLimit|X04 }} and comp_eta_{{ o1.type|lower }}_bx_{{ o1.bx_raw }}_0x{{ o1.etaW2LowerLimit|X04 }}_0x{{ o1.etaW2UpperLimit|X04 }};
    {%- endif %}    
  {%- endif %}    
  {%- if condition.nr_objects > 1 %}  
    {%- if o2.etaNrCuts == 0 and o2.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_pt_{{ o2.threshold|X04 }} <= comp_pt_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_0x{{ o2.threshold|X04 }};
    {%- elif o2.etaNrCuts == 1 and o2.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_pt_{{ o2.threshold|X04 }}_eta_{{ o2.etaW1LowerLimit|X04 }}_{{ o2.etaW1UpperLimit|X04 }} <= comp_pt_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_0x{{ o2.threshold|X04 }} and comp_eta_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_0x{{ o2.etaW1LowerLimit|X04 }}_0x{{ o2.etaW1UpperLimit|X04 }};
    {%- elif o2.etaNrCuts == 2 and o2.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_pt_{{ o2.threshold|X04 }}_eta_{{ o2.etaW1LowerLimit|X04 }}_{{ o2.etaW1UpperLimit|X04 }}_{{ o2.etaW2LowerLimit|X04 }}_{{ o2.etaW2UpperLimit|X04 }} <= comp_pt_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_0x{{ o2.threshold|X04 }} and (comp_eta_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_0x{{ o2.etaW1LowerLimit|X04 }}_0x{{ o2.etaW1UpperLimit|X04 }} and comp_eta_{{ o2.type|lower }}_bx_{{ o2.bx_raw }}_0x{{ o2.etaW2LowerLimit|X04 }}_0x{{ o2.etaW2UpperLimit|X04 }};
    {%- endif %}    
  {%- endif %}    
  {%- if condition.nr_objects > 2 %}  
    {%- if o3.etaNrCuts == 0 and o3.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_pt_{{ o3.threshold|X04 }} <= comp_pt_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_0x{{ o3.threshold|X04 }};
    {%- elif o3.etaNrCuts == 1 and o3.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_pt_{{ o3.threshold|X04 }}_eta_{{ o3.etaW1LowerLimit|X04 }}_{{ o3.etaW1UpperLimit|X04 }} <= comp_pt_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_0x{{ o3.threshold|X04 }} and comp_eta_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_0x{{ o3.etaW1LowerLimit|X04 }}_0x{{ o3.etaW1UpperLimit|X04 }};
    {%- elif o3.etaNrCuts == 2 and o3.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_pt_{{ o3.threshold|X04 }}_eta_{{ o3.etaW1LowerLimit|X04 }}_{{ o3.etaW1UpperLimit|X04 }}_{{ o3.etaW2LowerLimit|X04 }}_{{ o3.etaW2UpperLimit|X04 }} <= comp_pt_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_0x{{ o3.threshold|X04 }} and (comp_eta_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_0x{{ o3.etaW1LowerLimit|X04 }}_0x{{ o3.etaW1UpperLimit|X04 }} and comp_eta_{{ o3.type|lower }}_bx_{{ o3.bx_raw }}_0x{{ o3.etaW2LowerLimit|X04 }}_0x{{ o3.etaW2UpperLimit|X04 }};
    {%- endif %}    
  {%- endif %}    
  {%- if condition.nr_objects > 3 %}  
    {%- if o4.etaNrCuts == 0 and o4.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_pt_{{ o4.threshold|X04 }} <= comp_pt_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_0x{{ o4.threshold|X04 }};
    {%- elif o4.etaNrCuts == 1 and o4.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_pt_{{ o4.threshold|X04 }}_eta_{{ o4.etaW1LowerLimit|X04 }}_{{ o4.etaW1UpperLimit|X04 }} <= comp_pt_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_0x{{ o4.threshold|X04 }} and comp_eta_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_0x{{ o4.etaW1LowerLimit|X04 }}_0x{{ o4.etaW1UpperLimit|X04 }};
    {%- elif o4.etaNrCuts == 2 and o4.phiFullRange == 'true' and o1.isolationLUT == 15 and o1.qualityLUT == 65535 %}  
    comb_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_pt_{{ o4.threshold|X04 }}_eta_{{ o4.etaW1LowerLimit|X04 }}_{{ o4.etaW1UpperLimit|X04 }}_{{ o4.etaW2LowerLimit|X04 }}_{{ o4.etaW2UpperLimit|X04 }} <= comp_pt_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_0x{{ o4.threshold|X04 }} and (comp_eta_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_0x{{ o4.etaW1LowerLimit|X04 }}_0x{{ o4.etaW1UpperLimit|X04 }} and comp_eta_{{ o4.type|lower }}_bx_{{ o4.bx_raw }}_0x{{ o4.etaW2LowerLimit|X04 }}_0x{{ o4.etaW2UpperLimit|X04 }};
    {%- endif %}    
  {%- endif %}     
{%- endblock instantiate_comb_and %}
{# eof #}
