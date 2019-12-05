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
{%- set sig_calc_deta_list = [] %}
{%- set sig_calc_dphi_list = [] %}
{%- for condition in module.caloCaloCorrConditions %}
    {%- include "helper/helper_calc_deta_dphi_signals.txt" %}
{%- endfor %}
{%- for condition in module.caloMuonCorrConditions %}
    {%- include "helper/helper_calc_deta_dphi_signals.txt" %}
{%- endfor %}
{%- for i in sig_calc_deta_list | unique %}
    {%- set list_split = i.split('_') %}
    signal deta_calc_{{ list_split[0]|lower }}_{{ list_split[1]|lower }} : obj_bx_max_eta_range_array;
{%- endfor %}
{%- for i in sig_calc_dphi_list | unique %}
    {%- set list_split = i.split('_') %}
    signal dphi_calc_{{ list_split[0]|lower }}_{{ list_split[1]|lower }} : obj_bx_max_eta_range_array;
{%- endfor %}
    -- Correlation cuts
{%- set corr_cuts_list = [] %}
{%- for condition in module.caloCaloCorrConditions %}
    {%- include "helper/helper_corr_cuts_signals.txt" %}
{%- endfor %}
{%- for condition in module.caloMuonCorrConditions %}
   {%- include "helper/helper_corr_cuts_signals.txt" %}
{%- endfor %}
{%- for i in corr_cuts_list | unique %}
    signal {{ i | lower }} : obj_bx_corr_cuts_std_logic_array;
{%- endfor %}
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
{%- set comp_obj_cuts_list = [] %}
{%- for condition in module.caloConditions %}
    {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comp_obj_cuts_signals.txt" %}
    {%- endwith %}
{%- endfor %}    
{%- for condition in module.esumsConditions %}
    {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comp_obj_cuts_signals.txt" %}
    {%- endwith %}
{%- endfor %}    
{%- for condition in module.minBiasConditions %}
    {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comp_obj_cuts_signals.txt" %}
    {%- endwith %}
{%- endfor %}    
{%- for condition in module.muonConditions %}
    {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comp_obj_cuts_signals.txt" %}
    {%- endwith %}
{%- endfor %}    
{%- for condition in module.caloCaloCorrConditions %}
    {%- with obj1 = condition.objects[0], obj2 = condition.objects[1] %}
    {%- include "helper/helper_comp_obj_cuts_signals_corr_cond.txt" %}
    {%- endwith %}
{%- endfor %}    
{%- for condition in module.caloCaloCorrOvRmConditions %}
  {%- if condition.nr_objects > 2 %}
    {%- with obj1 = condition.objects[0], obj2 = condition.objects[1], obj3 = condition.objects[2], nr_obj = condition.nr_objects %}
    {%- include "helper/helper_comp_obj_cuts_signals_corr_cond_ovrm.txt" %}
    {%- endwith %}
  {%- else %}
    {%- with obj1 = condition.objects[0], obj2 = condition.objects[1], nr_obj = condition.nr_objects %}
    {%- include "helper/helper_comp_obj_cuts_signals_corr_cond_ovrm.txt" %}
    {%- endwith %}
  {%- endif %}
{%- endfor %}    
{%- for condition in module.caloMuonCorrConditions %}
    {%- with obj1 = condition.objects[0], obj2 = condition.objects[1] %}
    {%- include "helper/helper_comp_obj_cuts_signals_corr_cond.txt" %}
    {%- endwith %}
{%- endfor %}    
{%- for i in comp_obj_cuts_list | unique %}
  {%- set list_split = i.split('_') %}
  {%- if list_split[0] == 'pt' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }} : std_logic;
  {%- elif list_split[0] == 'eta' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }}_{{ list_split[7] }} : std_logic;
  {%- elif list_split[0] == 'phi' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }}_{{ list_split[7] }} : std_logic;
  {%- elif list_split[0] == 'iso' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }} : std_logic;
  {%- elif list_split[0] == 'qual' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }} : std_logic;
  {%- elif list_split[0] == 'charge' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }} : std_logic;
  {%- elif list_split[0] == 'count' %}
    signal comp_{{ list_split[0] }}_{{ list_split[1]|lower }}_bx_{{ list_split[3] }}_{{ list_split[6] }} : std_logic;
  {%- endif %}
{%- endfor %}
    -- Correlation cuts 
{%- set comp_corr_cuts_list = [] %}
{%- for condition in module.caloCaloCorrConditions %}
    {%- include "helper/helper_comp_corr_cuts_signals.txt" %}
{%- endfor %}
{%- for condition in module.caloMuonCorrConditions %}
    {%- include "helper/helper_comp_corr_cuts_signals.txt" %}
{%- endfor %}   
{%- for i in comp_corr_cuts_list | unique %}
    signal comp_{{ i | lower }} : std_logic;
{%- endfor %}
    -- Muon charge correlation 
-- ********************************************
-- to be included!!!
-- ********************************************
-- Conditions inputs
    -- Object cuts "and"
{%- set comb_signals_list = [] %}
{%- for condition in module.caloConditions %}
  {%- for i in range(condition.nr_objects) %}
    {%- with obj = condition.objects[i] %}
      {%- include "helper/helper_comb_and_calos_signals.txt" %}
    {%- endwith %}
  {%- endfor %}    
{%- endfor %}    
{%- for condition in module.esumsConditions %}
  {%- set o1 = condition.objects[0] %}
  {%- if o1.type|lower == 'asymet' or o1.type|lower == 'asymht' or o1.type|lower == 'asymethf' or o1.type|lower == 'asymhthf' %}
   {%- with obj = condition.objects[0] %}
      {%- include "helper/helper_comb_and_count_signals.txt" %}
    {%- endwith %}
  {%- else %}
    {%- with obj = condition.objects[0] %}
     {%- include "helper/helper_comb_and_esums_signals.txt" %}
    {%- endwith %}
  {%- endif %} 
{%- endfor %}    
{%- for condition in module.minBiasConditions %}
  {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comb_and_count_signals.txt" %}
  {%- endwith %}
{%- endfor %}    
{%- for condition in module.muonConditions %}
  {%- for i in range(condition.nr_objects) %}
    {%- with obj = condition.objects[i] %}
      {%- include "helper/helper_comb_and_muons_signals.txt" %}
    {%- endwith %}
  {%- endfor %}    
{%- endfor %}    
{%- for condition in module.caloCaloCorrConditions %}
  {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comb_and_calos_signals.txt" %}
  {%- endwith %}
  {%- with obj = condition.objects[1] %}
    {%- include "helper/helper_comb_and_calos_signals.txt" %}
  {%- endwith %}
{%- endfor %}    
{%- for condition in module.caloCaloCorrOvRmConditions %}
  {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comb_and_calos_signals.txt" %}
  {%- endwith %}
  {%- with obj = condition.objects[1] %}
    {%- include "helper/helper_comb_and_calos_signals.txt" %}
  {%- endwith %}
  {%- if condition.nr_objects > 2 %}
    {%- with obj = condition.objects[2] %}
     {%- include "helper/helper_comb_and_calos_signals.txt" %}
    {%- endwith %}
  {%- endif %} 
{%- endfor %}    
{%- for condition in module.caloMuonCorrConditions %}
  {%- with obj = condition.objects[0] %}
    {%- include "helper/helper_comb_and_calos_signals.txt" %}
  {%- endwith %}
  {%- with obj = condition.objects[1] %}
    {%- include "helper/helper_comb_and_muons_signals.txt" %}
  {%- endwith %}
{%- endfor %}    
{%- for i in comb_signals_list | unique %}
    signal comb_{{ i | lower }} : std_logic;
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
{%- for i in sig_calc_deta_list | unique %}
  {% set list_split = i.split('_') %}
  {%- with obj1 = list_split[0], obj2 = list_split[1], bx1 = list_split[0], bx2 = list_split[0] %}
    {%- include "instances/deta_calc.vhd" %}
    {%- include "instances/deta_lut.vhd" %}
  {%- endwith %}
  {%- endfor %}
{%- for i in sig_calc_deta_list | unique %}
  {% set list_split = i.split('_') %}
  {%- with obj1 = list_split[0], obj2 = list_split[1], bx1 = list_split[0], bx2 = list_split[0] %}
    {%- include "instances/dphi_calc.vhd" %}
    {%- include "instances/dphi_lut.vhd" %}
  {%- endwith %}
{%- endfor %}

-- Second stage: comparisons
{%- for i in comp_obj_cuts_list | unique %}
  {%- set list_split = i.split('_') %}    
  {%- if list_split[0] == 'pt' %}
    {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], thr = list_split[6].split('x')[1], ge = list_split[7] %}
    {%- include "instances/comparator_pt_cut.vhd" %}
    {%- endwith %}
  {%- elif list_split[0] == 'eta' %}
    {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], limit_l = list_split[6].split('x')[1], limit_u = list_split[7].split('x')[1] %}
    {%- include "instances/comparator_eta_cut.vhd" %}
    {%- endwith %}
  {%- elif list_split[0] == 'phi' %}
    {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], limit_l = list_split[6].split('x')[1], limit_u = list_split[7].split('x')[1] %}
    {%- include "instances/comparator_phi_cut.vhd" %}
    {%- endwith %}
  {%- elif list_split[0] == 'iso' %}
    {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], iso_lut = list_split[6].split('x')[1] %}
    {%- include "instances/comparator_iso_cut.vhd" %}
    {%- endwith %}
  {%- elif list_split[0] == 'qual' %}
    {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], qual_lut = list_split[6].split('x')[1] %}
    {%- include "instances/comparator_qual_cut.vhd" %}
    {%- endwith %}
  {%- elif list_split[0] == 'charge' %}
    {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], charge_str = list_split[6] %}
    {%- include "instances/comparator_charge_cut.vhd" %}
    {%- endwith %}
  {%- elif list_split[0] == 'count' %}
      {%- with obj = list_split[1], bx = list_split[3], bx_raw = list_split[5], count = list_split[6].split('x')[1] %}
    {%- include "instances/comparator_count.vhd" %}
      {%- endwith %}
  {%- endif %}
{%- endfor %}

    -- Muon charge correlation 
-- ********************************************
-- to be included!!!
-- ********************************************

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
{%- for i in comb_signals_list | unique %}
  {%- set list_split = i.split('_') %}    
  {%- with elem = i, elem_split = list_split %}
    {%- if elem_split[3] == 'count' %}
      {%- include "helper/helper_comb_and_count.txt" %}
    {%- elif elem_split[3] == 'mu' %}
-- muon_iso: {{elem_split[22]}}
      {%- include "helper/helper_comb_and_muons.txt" %}
    {%- elif elem_split[3] == 'eg' or elem_split[3] == 'jet' or elem_split[3] == 'tau' %}
-- calo_iso: {{elem_split[22]}}
      {%- include "helper/helper_comb_and_calos.txt" %}
    {%- else %}
      {%- include "helper/helper_comb_and_esums.txt" %}
    {%- endif %} 
  {%- endwith %}
{%- endfor %}
    -- Instantiations of conditions
{%- for condition in module.caloConditions %}
    {%- include "instances/combinatorial_conditions_calos.vhd" %}
{%- endfor %}    
{%- for condition in module.esumsConditions %}
  {%- set o1 = condition.objects[0] %}
  {%- if o1.type|lower == 'asymet' or o1.type |lower== 'asymht' or o1.type|lower == 'asymethf' or o1.type|lower == 'asymhthf' %}
    {%- include "instances/combinatorial_conditions_count_obj.vhd" %}
  {%- else %}
     {%- include "instances/combinatorial_conditions_esums.vhd" %}
  {%- endif %} 
{%- endfor %}    
{%- for condition in module.minBiasConditions %}
    {%- include "instances/combinatorial_conditions_count_obj.vhd" %}
{%- endfor %}    
{%- for condition in module.muonConditions %}
    {%- include "instances/combinatorial_conditions_muons.vhd" %}
{%- endfor %}    
{%- for condition in module.caloCaloCorrConditions %}
    {%- include "instances/correlation_conditions.vhd" %}
{%- endfor %}    
{%- for condition in module.caloMuonCorrConditions %}
    {%- include "instances/correlation_conditions.vhd" %}
{%- endfor %}    
{%- for condition in module.caloCaloCorrOvRmConditions %}
    {%- include "instances/correlation_conditions_ovrm.vhd" %}
{%- endfor %}    
    -- Centrality assignment
{%- for condition in module.signalConditions %}
    {%- include "instances/signal_condition.vhd" %}
{%- endfor %}
    -- External condition assignment
{%- for condition in module.externalConditions %}
    {{ condition.vhdl_signal }} <= data_in.ext_cond(bx({{ condition.objects[0].bx_raw }}))({{ condition.objects[0].externalChannelId }});
{%- endfor %}
-- Instantiations of algorithms
{% for algorithm in module.algorithms|sort_by_attribute('index') %}
    {{ algorithm.vhdl_signal }} <= {{ algorithm.vhdl_expression }};
    algo({{ algorithm.module_index | d}}) <= {{ algorithm.vhdl_signal }};
{%- endfor %}

end architecture rtl;

