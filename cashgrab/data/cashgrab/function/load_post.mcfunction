# load_post.mcfunction
#
# Summary: Loads class info from cashgrab core into cashgrab:game_info.classes and cashgrab:game_info.trinkets lists
#
# Arguments: (none)

# --- Append class roster data

# Griefer
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/griefer/pmt_griefer_init",\
func_inv:"cashgrab:classes/griefer/pmt_griefer_inv",\
func_inv_ability_icon:"cashgrab:classes/griefer/pmt_griefer_inv_ability_icon",\
func_tick:"cashgrab:classes/griefer/pmt_griefer_tick",\
func_use_ability:"cashgrab:classes/griefer/pmt_griefer_use_ability",\
func_cts_icon:"cashgrab:classes/griefer/pmt_griefer_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Skirmisher
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/skirmisher/pmt_skirmisher_init",\
func_inv:"cashgrab:classes/skirmisher/pmt_skirmisher_inv",\
func_inv_ability_icon:"cashgrab:classes/skirmisher/pmt_skirmisher_inv_ability_icon",\
func_tick:"cashgrab:classes/skirmisher/pmt_skirmisher_tick",\
func_use_ability:"cashgrab:classes/skirmisher/pmt_skirmisher_use_ability",\
func_cts_icon:"cashgrab:classes/skirmisher/pmt_skirmisher_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Spectre
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/spectre/pmt_spectre_init",\
func_inv:"cashgrab:classes/spectre/pmt_spectre_inv",\
func_inv_ability_icon:"cashgrab:classes/spectre/pmt_spectre_inv_ability_icon",\
func_tick:"cashgrab:classes/spectre/pmt_spectre_tick",\
func_use_ability:"cashgrab:classes/spectre/pmt_spectre_use_ability",\
func_cts_icon:"cashgrab:classes/spectre/pmt_spectre_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Ranger
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/ranger/pmt_ranger_init",\
func_inv:"cashgrab:classes/ranger/pmt_ranger_inv",\
func_inv_ability_icon:"cashgrab:classes/ranger/pmt_ranger_inv_ability_icon",\
func_tick:"cashgrab:classes/ranger/pmt_ranger_tick",\
func_use_ability:"cashgrab:classes/ranger/pmt_ranger_use_ability",\
func_cts_icon:"cashgrab:classes/ranger/pmt_ranger_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Artillery
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/artillery/pmt_artillery_init",\
func_inv:"cashgrab:classes/artillery/pmt_artillery_inv",\
func_inv_ability_icon:"cashgrab:classes/artillery/pmt_artillery_inv_ability_icon",\
func_tick:"cashgrab:classes/artillery/pmt_artillery_tick",\
func_use_ability:"cashgrab:classes/artillery/pmt_artillery_use_ability",\
func_cts_icon:"cashgrab:classes/artillery/pmt_artillery_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Champion
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/champion/pmt_champion_init",\
func_inv:"cashgrab:classes/champion/pmt_champion_inv",\
func_inv_ability_icon:"cashgrab:classes/champion/pmt_champion_inv_ability_icon",\
func_tick:"cashgrab:classes/champion/pmt_champion_tick",\
func_use_ability:"cashgrab:classes/champion/pmt_champion_use_ability",\
func_cts_icon:"cashgrab:classes/champion/pmt_champion_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Frost Knight
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/frostknight/pmt_frostknight_init",\
func_inv:"cashgrab:classes/frostknight/pmt_frostknight_inv",\
func_inv_ability_icon:"cashgrab:classes/frostknight/pmt_frostknight_inv_ability_icon",\
func_tick:"cashgrab:classes/frostknight/pmt_frostknight_tick",\
func_use_ability:"cashgrab:classes/frostknight/pmt_frostknight_use_ability",\
func_cts_icon:"cashgrab:classes/frostknight/pmt_frostknight_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Titan
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/titan/pmt_titan_init",\
func_inv:"cashgrab:classes/titan/pmt_titan_inv",\
func_inv_ability_icon:"cashgrab:classes/titan/pmt_titan_inv_ability_icon",\
func_tick:"cashgrab:classes/titan/pmt_titan_tick",\
func_use_ability:"cashgrab:classes/titan/pmt_titan_use_ability",\
func_cts_icon:"cashgrab:classes/titan/pmt_titan_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Alchemist
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/alchemist/pmt_alchemist_init",\
func_inv:"cashgrab:classes/alchemist/pmt_alchemist_inv",\
func_inv_ability_icon:"cashgrab:classes/alchemist/pmt_alchemist_inv_ability_icon",\
func_tick:"cashgrab:classes/alchemist/pmt_alchemist_tick",\
func_use_ability:"cashgrab:classes/alchemist/pmt_alchemist_use_ability",\
func_cts_icon:"cashgrab:classes/alchemist/pmt_alchemist_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Chronomancer
data modify storage cashgrab:game_info classes append value {\
func_init:"cashgrab:classes/chronomancer/pmt_chronomancer_init",\
func_inv:"cashgrab:classes/chronomancer/pmt_chronomancer_inv",\
func_inv_ability_icon:"cashgrab:classes/chronomancer/pmt_chronomancer_inv_ability_icon",\
func_tick:"cashgrab:classes/chronomancer/pmt_chronomancer_tick",\
func_use_ability:"cashgrab:classes/chronomancer/pmt_chronomancer_use_ability",\
func_cts_icon:"cashgrab:classes/chronomancer/pmt_chronomancer_cts_inv_icon",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Append trinket roster data

data modify storage cashgrab:game_info trinkets append value {\
func_init:"cashgrab:trinkets/vigor_flask/pmt_vigor_flask_init",\
func_inv:"cashgrab:trinkets/vigor_flask/pmt_vigor_flask_inv",\
func_tick:"cashgrab:trinkets/vigor_flask/pmtl_vigor_flask_tick",\
func_cts_icon:"cashgrab:trinkets/vigor_flask/pmt_vigor_flask_cts_inv_icon",\
}
