-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: {{ module.id }}

-- Name of L1 Trigger Menu:
-- {{ menu.info.name }}

-- Unique ID of L1 Trigger Menu:
-- {{ menu.info.uuid_menu }}

-- Unique ID of firmware implementation:
-- {{ menu.info.uuid_firmware }}

-- Scale set:
-- {{ menu.info.scale_set }}

-- VHDL producer version
-- v{{ menu.info.sw_version }}
-- ========================================================

library ieee;
use ieee.std_logic_1164.all;

use work.lhc_data_pkg.all;
use work.gtl_pkg.all;
use work.lut_pkg.all;
use work.l1menu_pkg.all;

entity l1menu is
    port(
        lhc_clk : in std_logic;
        data_in : in data_pipeline_record;
        conv_in : in conv_pipeline_record;
        algo : out std_logic_vector(NR_ALGOS-1 downto 0));
end l1menu;

architecture rtl of l1menu is
-- Calculations outputs
    -- Differences
{%- for condition in module.caloCaloCorrConditions %}
  {%- if condition.deltaEta.enabled == 'true' or condition.deltaR.enabled == 'true' or (condition.mass.enabled == 'true' and condition.mass.type == 0) %}
    signal deta_calc_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_max_eta_range_array;
  {%- endif %}
  {%- if condition.deltaPhi.enabled == 'true' or condition.deltaR.enabled == 'true' or condition.mass.enabled == 'true' %}
    signal dphi_calc_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_max_phi_range_array;
  {%- endif %}
{%- endfor %}
    -- Correlation cuts
{%- for condition in module.caloCaloCorrConditions %}
  {%- if condition.deltaEta.enabled == 'true' %}
    signal deta_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_max_eta_range_array;
  {%- endif %}
  {%- if condition.deltaPhi.enabled == 'true' %}
    signal dphi_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_max_phi_range_array;
  {%- endif %}
  {%- if condition.deltaR.enabled == 'true' %}
    signal dr_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_max_phi_range_array;
  {%- endif %}
  {%- if condition.mass.enabled == 'true' and condition.mass.type == 0 %}
    signal cosh_deta_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_corr_cuts_std_logic_array;
    signal inv_mass_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_corr_cuts_std_logic_array;
  {%- endif %}
  {%- if condition.mass.enabled == 'true' and condition.mass.type == 1 %}
    signal cos_dphi_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_corr_cuts_std_logic_array;
    signal trans_mass_{{ condition.objects[0].type|lower }}_{{ condition.objects[1].type|lower }} : obj_bx_corr_cuts_std_logic_array;
  {%- endif %}
{%- endfor %}
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
{%- for condition in module.caloConditions %}
    signal comp_pt_{{ condition.objects[0].type|lower }}_bx_{{ condition.objects[0].bx }}_0x{{ condition.objects[0].threshold|X04 }} : std_logic;
    {%- include  "helper/helper_eta_signals.txt" %}
    {%- include  "helper/helper_phi_signals.txt" %}
    signal comp_iso_{{ condition.objects[0].type|lower }}_bx_{{ condition.objects[0].bx }}_0x{{ condition.objects[0].isolationLUT|X04 }} : std_logic;
{%- endfor %}    
{%- for condition in module.muonConditions %}
    signal comp_pt_{{ condition.objects[0].type|lower }}_bx_{{ condition.objects[0].bx }}_0x{{ condition.objects[0].threshold|X04 }} : std_logic;
    {%- include  "helper/helper_eta_signals.txt" %}
    {%- include  "helper/helper_phi_signals.txt" %}
    signal comp_iso_{{ condition.objects[0].type|lower }}_bx_{{ condition.objects[0].bx }}_0x{{ condition.objects[0].isolationLUT|X04 }} : std_logic;
    signal comp_qual_{{ condition.objects[0].type|lower }}_bx_{{ condition.objects[0].bx }}_0x{{ condition.objects[0].qualityLUT|X04 }} : std_logic;
{%- endfor %}    
    -- Correlation cuts 
    
    -- Muon charge correlation 
    
    -- Asymmetry  
    
    -- Minimum-bias 
    
-- Conditions inputs
    -- Object cuts "and"
{%- for condition in module.caloConditions %}
  {%- if condition.nr_objects > 0 %}
    {%- with obj = condition.objects[0] %}
    {%- include  "helper/helper_comb_and_calos_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
  {%- if condition.nr_objects > 1 %}    
    {%- with obj = condition.objects[1] %}
    {%- include  "helper/helper_comb_and_calos_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
  {%- if condition.nr_objects > 2 %}    
    {%- with obj = condition.objects[2] %}
    {%- include  "helper/helper_comb_and_calos_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
  {%- if condition.nr_objects > 3 %}    
    {%- with obj = condition.objects[3] %}
    {%- include  "helper/helper_comb_and_calos_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
{%- endfor %}    
{%- for condition in module.muonConditions %}
  {%- if condition.nr_objects > 0 %}
    {%- with obj = condition.objects[0] %}
    {%- include  "helper/helper_comb_and_muons_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
  {%- if condition.nr_objects > 1 %}    
    {%- with obj = condition.objects[1] %}
    {%- include  "helper/helper_comb_and_muons_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
  {%- if condition.nr_objects > 2 %}    
    {%- with obj = condition.objects[2] %}
    {%- include  "helper/helper_comb_and_muons_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
  {%- if condition.nr_objects > 3 %}    
    {%- with obj = condition.objects[3] %}
    {%- include  "helper/helper_comb_and_muons_signals.txt" -%}
    {%- endwith -%}
  {%- endif -%}    
{%- endfor %}    
{%- for condition in module.caloCaloCorrConditions %}
    {%- with obj = condition.objects[0] %}
    {%- include  "helper/helper_comb_and_calos_signals.txt" -%}
    {%- endwith -%}
    {%- with obj = condition.objects[1] %}
    {%- include  "helper/helper_comb_and_calos_signals.txt" -%}
    {%- endwith -%}
{%- endfor %}        
-- Signal definition for conditions names
{%- for condition in module.conditions %}
    signal {{ condition.vhdl_signal }} : std_logic;
{%- endfor %}
-- Signal definition for algorithms names
{%- for algorithm in module.algorithms|sort_by_attribute('index') %}
    signal {{ algorithm.vhdl_signal }} : std_logic;
{%- endfor %}

begin
-- First stage: calculations
{%- for condition in module.caloCaloCorrConditions %}
  {%- if condition.deltaEta.enabled == 'true' or condition.deltaR.enabled == 'true' or (condition.mass.enabled == 'true' and condition.mass.type == 0) %}
    {%- include  "instances/deta_calc.vhd" %}
    {%- include  "instances/deta_lut.vhd" %}
  {%- endif %}
  {%- if condition.deltaPhi.enabled == 'true' or condition.deltaR.enabled == 'true' or (condition.mass.enabled == 'true' and condition.mass.type == 0) %}
    {%- include  "instances/dphi_calc.vhd" %}
    {%- include  "instances/dphi_lut.vhd" %}
  {%- endif %}
  {%- if condition.deltaR.enabled == 'true' %}
    {%- include  "instances/delta_r.vhd" %}
  {%- endif %}
  {%- if condition.mass.enabled == 'true' %}
    {%- if condition.mass.type == 0 %}
    {%- include  "instances/cosh_deta_lut.vhd" %}
    {%- include  "instances/cos_dphi_lut.vhd" %}
    {%- include  "instances/invariant_mass.vhd" %}
    {%- else %}
    {%- include  "instances/cosh_deta_lut.vhd" %}
    {%- include  "instances/cos_dphi_lut.vhd" %}
    {%- include  "instances/transverse_mass.vhd" %}
    {%- endif %}
  {%- endif %}
{%- endfor %}
-- Second stage: comparisons
{%- for condition in module.caloConditions %}
    {%- include  "instances/comparator_pt_cut.vhd" %}
    {%- include  "helper/helper_eta_cuts.txt" %}
    {%- include  "helper/helper_phi_cuts.txt" %}
    {%- include  "instances/comparator_iso_cut.vhd" %}
{%- endfor %}
{%- for condition in module.muonConditions %}
    {%- include  "instances/comparator_pt_cut.vhd" %}
    {%- include  "helper/helper_eta_cuts.txt" %}
    {%- include  "helper/helper_phi_cuts.txt" %}
    {%- include  "instances/comparator_iso_cut.vhd" %}
    {%- include  "instances/comparator_qual_cut.vhd" %}
{%- endfor %}
{%- for condition in module.caloCaloCorrConditions %}
    {%- include  "instances/comparator_pt_cut.vhd" %}
  {%- if condition.deltaEta.enabled == 'true' %}
    {%- include  "instances/comparator_deta_cut.vhd" %}
  {%- endif %}
  {%- if condition.mass.enabled == 'true' %}
    {%- if condition.mass.type == 0 %}
    {%- include  "instances/comparator_inv_mass_cut.vhd" %}    
    {%- else %}
    {%- include  "instances/comparator_trans_mass_cut.vhd" %}    
    {%- endif %}
  {%- endif %}
{%- endfor %}
-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
{%- for condition in module.caloConditions %}
    {%- include  "instances/comb_and_calos.vhd" -%}
{%- endfor -%}    
{%- for condition in module.muonConditions %}
    {%- include  "instances/comb_and_muons.vhd" -%}
{%- endfor -%}    
{%- for condition in module.caloCaloCorrConditions %}
    {%- include  "instances/comb_and_calos.vhd" -%}
{%- endfor -%}    
    -- Instantiations of conditions
{%- for condition in module.caloConditions %}
    {%- include  "instances/combinatorial_conditions_calos.vhd" %}
{%- endfor %}    
{%- for condition in module.muonConditions %}
    {%- include  "instances/combinatorial_conditions_muons.vhd" %}
{%- endfor %}    
{%- for condition in module.caloCaloCorrConditions %}
    {%- include  "instances/correlation_conditions.vhd" %}
{%- endfor %}    
{%- for condition in module.caloMuonCorrConditions %}
    {%- include  "instances/correlation_conditions.vhd" %}
{%- endfor %}    
    -- Centrality assignment
{%- for condition in module.signalConditions %}
    {%- include  "instances/signal_condition.vhd" %}
{%- endfor -%}
    -- External condition assignment
{%- for condition in module.externalConditions %}
    {{ condition.vhdl_signal }} <= data_in.ext_cond(bx({{ condition.objects[0].bx_raw }}))({{ condition.objects[0].externalChannelId }});
{%- endfor -%}
-- Instantiations of algorithms
{% for algorithm in module.algorithms|sort_by_attribute('index') %}
    {{ algorithm.vhdl_signal }} <= {{ algorithm.vhdl_expression }};
    algo({{ algorithm.module_index | d}}) <= {{ algorithm.vhdl_signal }};
{% endfor %}

end architecture rtl;

