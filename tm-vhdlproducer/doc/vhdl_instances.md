## VHDL instances in l1menu.vhd:

#### Syntax:
    
    -> VHDL instance
        - required instance for same object/bx combination - 1st level
            - required instance for same object/bx combination - 2nd level

### Calculations
    
    Once for every bx-bx combination:
    -> muon_charge_correlations.vhd
    
    Once for every object/bx-object/bx combination for following calculations:
    -> deta_lut.vhd
        - deta_calc.vhd
    
    -> dphi_lut.vhd
        - dphi_calc.vhd
    
    -> delta_r.vhd
        - deta_lut.vhd
            - dphi_calc.vhd
    
    -> invariant_mass.vhd
        - cosh_deta_lut.vhd
            - dphi_calc.vhd
        - cos_dphi_lut.vhd
            - dphi_calc.vhd
    
    -> transverse_mass.vhd
        - cos_dphi_lut.vhd
            - dphi_calc.vhd
    
    -> twobody_pt.vhd
    
### Comparators

    Once for every different object cut:
    -> comparators_obj_cuts.vhd
    
    Once for every different correlation cut:
    -> comparators_corr_cuts.vhd
    
    Once for every different muon charge correlation:
    -> comparators_muon_charge_corr.vhd
    
### Combinations

    "AND" of objects cuts for conditions inputs
    
### Conditions

    -> combinatorial_conditions.vhd
    
    -> combinatorial_conditions_ovrm.vhd
    
    -> correlation_conditions.vhd
    
    -> correlation_conditions_ovrm.vhd
    
 ### Algorithms
 
    Algorithms statements
