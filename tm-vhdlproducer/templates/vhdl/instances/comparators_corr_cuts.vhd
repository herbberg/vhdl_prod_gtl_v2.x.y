{%- block instantiate_comparators_corr_cuts %}
  {%- set o1 = condition.objects[0] %}
  {%- set o2 = condition.objects[1] %}
  {%- if {{ condition.deltaEta.enabled }} %}
    comp_deta_{{ index }}_i: entity work.comparators_corr_cuts
  {%- elif {{ condition.deltaPhi.enabled }} %}
    comp_dphi_{{ index }}_i: entity work.comparators_corr_cuts
  {%- elif {{ condition.deltaR.enabled }} %}
    comp_dr_{{ index }}_i: entity work.comparators_corr_cuts
  {%- elif {{ condition.mass.enabled }} %}
    {%- if {{ condition.mass.type == 0 }} %}
    comp_inv_mass_{{ index }}_i: entity work.comparators_corr_cuts
    {%- else %}
    comp_trans_mass_{{ index }}_i: entity work.comparators_corr_cuts
    {%- endif %}
  {%- elif {{ condition.twoBodyPt.enabled }} %}
    comp_tbpt_{{ index }}_i: entity work.comparators_corr_cuts
  {%- endif %}
        generic map(
            N_{{ o1.type|upper }}_OBJECTS, N_{{ o2.type|upper }}_OBJECTS, ({{ o1.type }}_t,{{ o2.type }}_t),
            {{ o1.type|upper }}_{{ o2.type|upper }}_{{ o1.cut_handle.cut_type|upper }}_VECTOR_WIDTH,
  {%- if {{ condition.deltaEta.enabled }} %}
            deltaEta, X"{{ condition.deltaEta.lower|X13 }}", X"{{ condition.deltaEta.upper|X13 }}"        
  {%- elif {{ condition.deltaPhi.enabled }} %}
            deltaPhi, X"{{ condition.deltaPhi.lower|X13 }}", X"{{ condition.deltaPhi.upper|X13 }}"        
  {%- elif {{ condition.deltaR.enabled }} %}
            deltaR, X"{{ condition.deltaR.lower|X13 }}", X"{{ condition.deltaR.upper|X13 }}"        
  {%- elif {{ condition.mass.enabled }} %}
            mass, X"{{ condition.mass.lower|X13 }}", X"{{ condition.mass.upper|X13 }}"        
  {%- elif {{ condition.twoBodyPt.enabled }} %}
            twoBodyPt, X"{{ condition.twoBodyPt.lower|X13 }}", X"{{ condition.twoBodyPt.upper|X13 }}"        
  {%- endif %}
        )
        port map(
            lhc_clk, 
  {%- if {{ condition.deltaEta.enabled }} %}
            deta_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), deta_{{ o1.type }}_{{ o2.type }}_{{ index_comp_deta }}
  {%- elif {{ condition.deltaPhi.enabled }} %}
            dphi_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), dphi_{{ o1.type }}_{{ o2.type }}_{{ index_comp_dphi }}
  {%- elif {{ condition.deltaR.enabled }} %}
            dr_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), dr_{{ o1.type }}_{{ o2.type }}_{{ index_comp_dr }}
  {%- elif {{ condition.mass.enabled }} %}
    {%- if {{ condition.mass.type == 0 }} %}
            inv_mass_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), inv_mass_{{ o1.type }}_{{ o2.type }}_{{ index_comp_inv_mass }}
    {%- else %}
            trans_mass_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), trans_mass_{{ o1.type }}_{{ o2.type }}_{{ index_comp_trans_mass }}
    {%- endif %}
  {%- elif {{ {{ condition.twoBodyPt.enabled }} }} %}
            tbpt_{{ o1.type }}_{{ o2.type }}(bx({{ o1.object_handle.bx_offset }}),bx({{ o2.object_handle.bx_offset }})), tbpt_{{ o1.type }}_{{ o2.type }}_{{ index_comp_tbpt }}
  {%- endif %}
        );
{% endblock instantiate_comparators_corr_cuts %}
{# eof #}
