# Vampire

data modify storage cashgrab:game_info classes append value {\
s_class_name:"Vampire",\
func_pmt_init:"cg_maks:classes/vampire/pmt_vampire_init",\
func_pmt_inv:"cg_maks:classes/vampire/pmt_vampire_inv",\
func_pmt_inv_ability_icon:"cg_maks:classes/vampire/pmt_vampire_inv_ability_icon",\
func_pmtl_tick:"cg_maks:classes/vampire/pmtl_vampire_tick",\
func_pmtl_use_ability:"cg_maks:classes/vampire/pmtl_vampire_use_ability",\
func_pmtl_end:"cg_maks:classes/vampire/pmtl_vampire_end",\
func_pmt_cts_icon:"cg_maks:classes/vampire/pmt_vampire_cts_inv_icon",\
func_pmtl_cts_tick:"cg_maks:classes/vampire/pmtl_vampire_cts_tick",\
}

# Dancer

data modify storage cashgrab:game_info classes append value {\
s_class_name:"Dancer",\
func_pmt_init:"cg_maks:classes/dancer/pmt_dancer_init",\
func_pmt_inv:"cg_maks:classes/dancer/pmt_dancer_inv",\
func_pmt_inv_ability_icon:"cg_maks:classes/dancer/pmt_dancer_inv_ability_icon",\
func_pmtl_tick:"cg_maks:classes/dancer/pmtl_dancer_tick",\
func_pmtl_use_ability:"cg_maks:classes/dancer/pmtl_dancer_use_ability",\
func_pmtl_end:"cg_maks:classes/dancer/pmtl_dancer_end",\
func_pmt_cts_icon:"cg_maks:classes/dancer/pmt_dancer_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}