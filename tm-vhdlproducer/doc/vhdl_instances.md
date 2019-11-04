## VHDL instances in l1menu.vhd:

Syntax:
    
    -> VHDL instance
    
        - required instance same objects - 1st level
        
            - required instance same objects - 2nd level

### Calculations
    
    -> muon_charge_correlations.vhd
    
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

    -> comparators_obj_cuts.vhd
    
    -> comparators_corr_cuts.vhd
    
    -> comparators_muon_charge_corr.vhd
    
### Combinations

    -> equations of objects cuts for inputs of conditions
    
### Conditions

    -> combinatorial_conditions.vhd
    
    -> combinatorial_conditions_ovrm.vhd
    
    -> correlation_conditions.vhd
    
    -> correlation_conditions_ovrm.vhd
    
   
