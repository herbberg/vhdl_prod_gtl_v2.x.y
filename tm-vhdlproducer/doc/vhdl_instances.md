## VHDL instances in l1menu.vhd:

### Calculations
    
    -> muon_charge_correlations
    
    -> deta_lut
        - deta_calc
    
    -> dphi_lut
        - dphi_calc
    
    -> delta_r
        - deta_lut
            - dphi_calc
            
    -> invariant_mass
        - cosh_deta_lut
            - dphi_calc
        - cos_dphi_lut
            - dphi_calc
    
    -> transverse_mass
        - cos_dphi_lut
            - dphi_calc
    
    -> twobody_pt
    
### Comparators

    -> comparators_obj_cuts
    
    -> comparators_corr_cuts
    
    -> comparators_muon_charge_corr
    
### Combinations

    -> equations of objects cuts for inputs of conditions
    
### Conditions

    -> combinatorial_conditions
    
    -> combinatorial_conditions_ovrm
    
    -> correlation_conditions
    
    -> correlation_conditions_ovrm
    
   
