# load_class_info.mcfunction
#
# Summary: Loads class info from cashgrab core into cashgrab:game_info.classes data structure
#
# Arguments: (none)

# Append class roster data
data modify storage cashgrab:game_info classes append value {\
class_name:"NULL",\
func_init:"cashgrab:util/dummy",\
func_inv:"cashgrab:util/dummy",\
func_inv_ability_icon:"cashgrab:util/dummy",\
func_tick:"cashgrab:util/dummy",\
func_use_ability:"cashgrab:util/dummy",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Griefer",\
func_init:"cashgrab:classes/griefer/pmt_griefer_init",\
func_inv:"cashgrab:classes/griefer/pmt_griefer_inv",\
func_inv_ability_icon:"cashgrab:classes/griefer/pmt_griefer_inv_ability_icon",\
func_tick:"cashgrab:classes/griefer/pmt_griefer_tick",\
func_use_ability:"cashgrab:classes/griefer/pmt_griefer_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Skirmisher",\
func_init:"cashgrab:classes/skirmisher/pmt_skirmisher_init",\
func_inv:"cashgrab:classes/skirmisher/pmt_skirmisher_inv",\
func_inv_ability_icon:"cashgrab:classes/skirmisher/pmt_skirmisher_inv_ability_icon",\
func_tick:"cashgrab:classes/skirmisher/pmt_skirmisher_tick",\
func_use_ability:"cashgrab:classes/skirmisher/pmt_skirmisher_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Spectre",\
func_init:"cashgrab:classes/spectre/pmt_spectre_init",\
func_inv:"cashgrab:classes/spectre/pmt_spectre_inv",\
func_inv_ability_icon:"cashgrab:classes/spectre/pmt_spectre_inv_ability_icon",\
func_tick:"cashgrab:classes/spectre/pmt_spectre_tick",\
func_use_ability:"cashgrab:classes/spectre/pmt_spectre_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Ranger",\
func_init:"cashgrab:classes/ranger/pmt_ranger_init",\
func_inv:"cashgrab:classes/ranger/pmt_ranger_inv",\
func_inv_ability_icon:"cashgrab:classes/ranger/pmt_ranger_inv_ability_icon",\
func_tick:"cashgrab:classes/ranger/pmt_ranger_tick",\
func_use_ability:"cashgrab:classes/ranger/pmt_ranger_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Artillery",\
func_init:"cashgrab:classes/artillery/pmt_artillery_init",\
func_inv:"cashgrab:classes/artillery/pmt_artillery_inv",\
func_inv_ability_icon:"cashgrab:classes/artillery/pmt_artillery_inv_ability_icon",\
func_tick:"cashgrab:classes/artillery/pmt_artillery_tick",\
func_use_ability:"cashgrab:classes/artillery/pmt_artillery_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Champion",\
func_init:"cashgrab:classes/champion/pmt_champion_init",\
func_inv:"cashgrab:classes/champion/pmt_champion_inv",\
func_inv_ability_icon:"cashgrab:classes/champion/pmt_champion_inv_ability_icon",\
func_tick:"cashgrab:classes/champion/pmt_champion_tick",\
func_use_ability:"cashgrab:classes/champion/pmt_champion_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Frost Knight",\
func_init:"cashgrab:classes/frostknight/pmt_frostknight_init",\
func_inv:"cashgrab:classes/frostknight/pmt_frostknight_inv",\
func_inv_ability_icon:"cashgrab:classes/frostknight/pmt_frostknight_inv_ability_icon",\
func_tick:"cashgrab:classes/frostknight/pmt_frostknight_tick",\
func_use_ability:"cashgrab:classes/frostknight/pmt_frostknight_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Titan",\
func_init:"cashgrab:classes/titan/pmt_titan_init",\
func_inv:"cashgrab:classes/titan/pmt_titan_inv",\
func_inv_ability_icon:"cashgrab:classes/titan/pmt_titan_inv_ability_icon",\
func_tick:"cashgrab:classes/titan/pmt_titan_tick",\
func_use_ability:"cashgrab:classes/titan/pmt_titan_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Alchemist",\
func_init:"cashgrab:classes/alchemist/pmt_alchemist_init",\
func_inv:"cashgrab:classes/alchemist/pmt_alchemist_inv",\
func_inv_ability_icon:"cashgrab:classes/alchemist/pmt_alchemist_inv_ability_icon",\
func_tick:"cashgrab:classes/alchemist/pmt_alchemist_tick",\
func_use_ability:"cashgrab:classes/alchemist/pmt_alchemist_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info classes append value {\
class_name:"Chronomancer",\
func_init:"cashgrab:classes/chronomancer/pmt_chronomancer_init",\
func_inv:"cashgrab:classes/chronomancer/pmt_chronomancer_inv",\
func_inv_ability_icon:"cashgrab:classes/chronomancer/pmt_chronomancer_inv_ability_icon",\
func_tick:"cashgrab:classes/chronomancer/pmt_chronomancer_tick",\
func_use_ability:"cashgrab:classes/chronomancer/pmt_chronomancer_use_ability",\
func_cts_icon:"cashgrab:util/dummy",\
func_cts_tick:"cashgrab:util/dummy",\
}

# Append trinket roster data
data modify storage cashgrab:game_info trinkets append value {\
trinket_name:"NULL",\
func_init:"cashgrab:util/dummy",\
func_inv:"cashgrab:util/dummy",\
func_tick:"cashgrab:util/dummy",\
func_cts_icon:"cashgrab:util/dummy",\
}

data modify storage cashgrab:game_info trinkets append value {\
trinket_name:"Vigor Flask",\
func_init:"cashgrab:trinkets/pmt_vigor_flask_init",\
func_inv:"cashgrab:trinkets/pmt_vigor_flask_inv",\
func_tick:"cashgrab:trinkets/pmtl_vigor_flask_tick",\
func_cts_icon:"cashgrab:util/dummy",\
}
