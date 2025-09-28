# =======================
# CLASSES
# =======================

# Vampire

data modify storage cashgrab:game_info classes append value {\
format:2,\
s_class_name:"Vampire",\
func_pmt_init:"cg_maks:classes/vampire/pmt_vampire_init",\
func_pmt_inv:"cg_maks:classes/vampire/pmt_vampire_inv",\
func_pmt_inv_ability_icon:"cg_maks:classes/vampire/pmt_vampire_inv_ability_icon",\
func_pmtl_tick:"cg_maks:classes/vampire/pmtl_vampire_tick",\
func_pmtl_use_ability:"cg_maks:classes/vampire/pmtl_vampire_use_ability",\
func_pmtl_end:"cg_maks:classes/vampire/pmtl_vampire_end",\
func_pmt_cts_icon:"cg_maks:classes/vampire/pmt_vampire_cts_inv_icon",\
func_pmtl_cts_tick:"cg_maks:classes/vampire/pmtl_vampire_cts_tick",\
func_pmt_score_kill:"cashgrab:util/noop",\
trinket_default_hotbar_slot:-1,\
}

# Dancer

data modify storage cashgrab:game_info classes append value {\
format:2,\
s_class_name:"Dancer",\
func_pmt_init:"cg_maks:classes/dancer/pmt_dancer_init",\
func_pmt_inv:"cg_maks:classes/dancer/pmt_dancer_inv",\
func_pmt_inv_ability_icon:"cg_maks:classes/dancer/pmt_dancer_inv_ability_icon",\
func_pmtl_tick:"cg_maks:classes/dancer/pmtl_dancer_tick",\
func_pmtl_use_ability:"cg_maks:classes/dancer/pmtl_dancer_use_ability",\
func_pmtl_end:"cg_maks:classes/dancer/pmtl_dancer_end",\
func_pmt_cts_icon:"cg_maks:classes/dancer/pmt_dancer_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
func_pmt_score_kill:"cashgrab:util/noop",\
trinket_default_hotbar_slot:-1,\
}

# =======================
# TRINKETS
# =======================

# Lava Cake

scoreboard objectives add evc_clay_balls minecraft.used:minecraft.clay_ball

data modify storage cashgrab:game_info trinkets append value {\
format:1,\
s_trinket_name:"Lava Cake",\
func_pmt_init:"cg_maks:trinkets/lava_cake/pmt_lava_cake_init",\
func_pmt_inv:"cg_maks:trinkets/lava_cake/pmt_lava_cake_inv",\
func_pmtl_use_item:"cg_maks:trinkets/lava_cake/pmt_lava_cake_use_item",\
func_pmt_cts_icon:"cg_maks:trinkets/lava_cake/pmt_lava_cake_cts_inv_icon",\
evc_usage_score:"evc_clay_balls",\
}

# Smoke Screen

scoreboard objectives add evc_ink_sac minecraft.used:minecraft.ink_sac

data modify storage cashgrab:game_info trinkets append value {\
format:1,\
s_trinket_name:"Smoke Screen",\
func_pmt_init:"cg_maks:trinkets/smoke_screen/pmt_smoke_screen_init",\
func_pmt_inv:"cg_maks:trinkets/smoke_screen/pmt_smoke_screen_inv",\
func_pmtl_use_item:"cg_maks:trinkets/smoke_screen/pmt_smoke_screen_use_item",\
func_pmt_cts_icon:"cg_maks:trinkets/smoke_screen/pmt_smoke_screen_cts_inv_icon",\
evc_usage_score:"evc_ink_sac",\
}