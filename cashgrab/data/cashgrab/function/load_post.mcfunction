# load_post.mcfunction
#
# Summary: Loads class info from cashgrab core into cashgrab:game_info.classes and cashgrab:game_info.trinkets lists
#
# Arguments: (none)

# --- Append class roster data

# Champion
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Champion",\
func_pmt_init:"cashgrab:classes/champion/pmt_champion_init",\
func_pmt_inv:"cashgrab:classes/champion/pmt_champion_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/champion/pmt_champion_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/champion/pmtl_champion_tick",\
func_pmtl_use_ability:"cashgrab:classes/champion/pmtl_champion_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/champion/pmt_champion_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

# Griefer
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Griefer",\
func_pmt_init:"cashgrab:classes/griefer/pmt_griefer_init",\
func_pmt_inv:"cashgrab:classes/griefer/pmt_griefer_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/griefer/pmt_griefer_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/griefer/pmtl_griefer_tick",\
func_pmtl_use_ability:"cashgrab:classes/griefer/pmtl_griefer_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/griefer/pmt_griefer_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:classes/griefer/pmtl_griefer_cts_tick",\
}

# Skirmisher
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Skirmisher",\
func_pmt_init:"cashgrab:classes/skirmisher/pmt_skirmisher_init",\
func_pmt_inv:"cashgrab:classes/skirmisher/pmt_skirmisher_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/skirmisher/pmt_skirmisher_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/skirmisher/pmtl_skirmisher_tick",\
func_pmtl_use_ability:"cashgrab:classes/skirmisher/pmtl_skirmisher_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/skirmisher/pmt_skirmisher_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

# Spectre
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Spectre",\
func_pmt_init:"cashgrab:classes/spectre/pmt_spectre_init",\
func_pmt_inv:"cashgrab:classes/spectre/pmt_spectre_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/spectre/pmt_spectre_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/spectre/pmtl_spectre_tick",\
func_pmtl_use_ability:"cashgrab:classes/spectre/pmtl_spectre_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/spectre/pmt_spectre_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:classes/spectre/pmtl_spectre_cts_tick",\
}

# Ranger
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Ranger",\
func_pmt_init:"cashgrab:classes/ranger/pmt_ranger_init",\
func_pmt_inv:"cashgrab:classes/ranger/pmt_ranger_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/ranger/pmt_ranger_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/ranger/pmtl_ranger_tick",\
func_pmtl_use_ability:"cashgrab:classes/ranger/pmtl_ranger_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/ranger/pmt_ranger_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:classes/ranger/pmtl_ranger_cts_tick",\
}

# Artillery
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Artillery",\
func_pmt_init:"cashgrab:classes/artillery/pmt_artillery_init",\
func_pmt_inv:"cashgrab:classes/artillery/pmt_artillery_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/artillery/pmt_artillery_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/artillery/pmtl_artillery_tick",\
func_pmtl_use_ability:"cashgrab:classes/artillery/pmtl_artillery_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/artillery/pmt_artillery_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:classes/artillery/pmtl_artillery_cts_tick",\
}

# Frost Knight
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Frost Knight",\
func_pmt_init:"cashgrab:classes/frostknight/pmt_frostknight_init",\
func_pmt_inv:"cashgrab:classes/frostknight/pmt_frostknight_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/frostknight/pmt_frostknight_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/frostknight/pmtl_frostknight_tick",\
func_pmtl_use_ability:"cashgrab:classes/frostknight/pmtl_frostknight_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/frostknight/pmt_frostknight_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

# Titan
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Titan",\
func_pmt_init:"cashgrab:classes/titan/pmt_titan_init",\
func_pmt_inv:"cashgrab:classes/titan/pmt_titan_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/titan/pmt_titan_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/titan/pmtl_titan_tick",\
func_pmtl_use_ability:"cashgrab:classes/titan/pmtl_titan_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/titan/pmt_titan_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

# Alchemist
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Alchemist",\
func_pmt_init:"cashgrab:classes/alchemist/pmt_alchemist_init",\
func_pmt_inv:"cashgrab:classes/alchemist/pmt_alchemist_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/alchemist/pmt_alchemist_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/alchemist/pmtl_alchemist_tick",\
func_pmtl_use_ability:"cashgrab:classes/alchemist/pmtl_alchemist_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/alchemist/pmt_alchemist_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:classes/alchemist/pmtl_alchemist_cts_tick",\
}

# Chronomancer
data modify storage cashgrab:game_info classes append value {\
s_class_name:"Chronomancer",\
func_pmt_init:"cashgrab:classes/chronomancer/pmt_chronomancer_init",\
func_pmt_inv:"cashgrab:classes/chronomancer/pmt_chronomancer_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/chronomancer/pmt_chronomancer_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/chronomancer/pmtl_chronomancer_tick",\
func_pmtl_use_ability:"cashgrab:classes/chronomancer/pmtl_chronomancer_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:classes/chronomancer/pmt_chronomancer_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:classes/chronomancer/pmtl_chronomancer_cts_tick",\
}

# Append trinket roster data

# Vigor Flask
data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Vigor Flask",\
func_pmt_init:"cashgrab:trinkets/vigor_flask/pmt_vigor_flask_init",\
func_pmt_inv:"cashgrab:trinkets/vigor_flask/pmt_vigor_flask_inv",\
func_pmtl_use_item:"cashgrab:trinkets/vigor_flask/pmtl_vigor_flask_use_item",\
func_pmt_cts_icon:"cashgrab:trinkets/vigor_flask/pmt_vigor_flask_cts_inv_icon",\
evc_usage_score:"evc_potions",\
}
