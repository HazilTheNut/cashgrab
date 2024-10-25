
# --- Add Class data

# Hexblade
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Hexblade",\
func_pmt_init:"cashgrab_ex:classes/hexblade/pmt_hexblade_init",\
func_pmt_inv:"cashgrab_ex:classes/hexblade/pmt_hexblade_inv",\
func_pmt_inv_ability_icon:"cashgrab_ex:classes/hexblade/pmt_hexblade_inv_ability_icon",\
func_pmtl_tick:"cashgrab_ex:classes/hexblade/pmtl_hexblade_tick",\
func_pmtl_use_ability:"cashgrab_ex:classes/hexblade/pmtl_hexblade_use_ability",\
func_pmtl_end:"cashgrab_ex:classes/hexblade/pmtl_hexblade_end",\
func_pmt_cts_icon:"cashgrab_ex:classes/hexblade/pmt_hexblade_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

# --- Add Trinket data

# Bandage
data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Bandage",\
func_pmt_init:"cashgrab_ex:trinkets/bandage/pmt_bandage_init",\
func_pmt_inv:"cashgrab_ex:trinkets/bandage/pmt_bandage_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/bandage/pmtl_bandage_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/bandage/pmt_bandage_cts_inv_icon",\
evc_usage_score:"evc_maps",\
}

# Accelerator
data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Accelerator",\
func_pmt_init:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_init",\
func_pmt_inv:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/accelerator/pmtl_accelerator_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_cts_inv_icon",\
evc_usage_score:"evc_xpbottles",\
}

