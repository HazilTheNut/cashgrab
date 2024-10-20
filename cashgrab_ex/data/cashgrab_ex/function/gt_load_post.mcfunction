
# --- Add Class data



# --- Add Trinket data

# Bandage
data modify storage cashgrab:game_info trinkets append value {\
func_pmt_init:"cashgrab_ex:trinkets/bandage/pmt_bandage_init",\
func_pmt_inv:"cashgrab_ex:trinkets/bandage/pmt_bandage_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/bandage/pmtl_bandage_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/bandage/pmt_bandage_cts_inv_icon",\
evc_usage_score:"evc_maps",\
is_dev_tool:0,\
}

# Accelerator
data modify storage cashgrab:game_info trinkets append value {\
func_pmt_init:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_init",\
func_pmt_inv:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/accelerator/pmtl_accelerator_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_cts_inv_icon",\
evc_usage_score:"evc_xpbottles",\
is_dev_tool:0,\
}

