## VHDL signal names in l1menu.vhd:

### Calculations outputs

#### Differences in eta and phi
    signal deta_calc_<obj type 1>_<obj type 2> : obj_bx_max_eta_range_array;
    signal dphi_calc_<obj type 1>_<obj type 2> : obj_bx_max_phi_range_array;

#### Correlation cuts (correlation cut list: deta, dphi, dr, inv_mass, trans_mass, tbpt)
    signal <cut type>_<obj type 1>_<obj type 2> : obj_bx_corr_cuts_std_logic_array;

#### Muon charge correlation
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;

### Comparators outputs

#### Object cuts (cut type list: pt, eta, phi, iso, qual, charge)
    signal <cut type>_<obj type>_<index> : <obj type>_obj_t;

#### Correlation cuts (correlation cut list: deta, dphi, dr, inv_mass, trans_mass, tbpt)
    signal <cut type>_<obj type 1>_<obj type 2>_<index> : <obj type 1>_<obj type 2>_obj_t;

#### Muon charge correlation
    signal cc_double_<index> : muon_cc_double_t;
    signal cc_triple_<index> : muon_cc_triple_t;
    signal cc_quad_<index> : muon_cc_quad_t;

### Conditions inputs
    signal comb_<obj type>_<index> : <obj type>_obj_t;

### Conditions outputs
    signal <condition name> : std_logic;

### Algorithms
    signal l1_<algo name> : std_logic;

