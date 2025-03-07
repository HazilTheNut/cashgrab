
# --- Add Class data

# Hexblade
data modify storage cashgrab:game_info classes append value {\
format:1,\
s_class_name:"Hexblade",\
func_pmt_init:"cashgrab_ex:classes/hexblade/pmt_hexblade_init",\
func_pmt_inv:"cashgrab_ex:classes/hexblade/pmt_hexblade_inv",\
func_pmt_inv_ability_icon:"cashgrab_ex:classes/hexblade/pmt_hexblade_inv_ability_icon",\
func_pmtl_tick:"cashgrab_ex:classes/hexblade/pmtl_hexblade_tick",\
func_pmtl_use_ability:"cashgrab_ex:classes/hexblade/pmtl_hexblade_use_ability",\
func_pmtl_end:"cashgrab_ex:classes/hexblade/pmtl_hexblade_end",\
func_pmt_cts_icon:"cashgrab_ex:classes/hexblade/pmt_hexblade_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
func_pmt_score_kill:"cashgrab:util/noop",\
}

# Cloudbreaker
data modify storage cashgrab:game_info classes append value {\
format:1,\
s_class_name:"Cloudbreaker",\
func_pmt_init:"cashgrab_ex:classes/cloudbreaker/pmt_cloudbreaker_init",\
func_pmt_inv:"cashgrab_ex:classes/cloudbreaker/pmt_cloudbreaker_inv",\
func_pmt_inv_ability_icon:"cashgrab_ex:classes/cloudbreaker/pmt_cloudbreaker_inv_ability_icon",\
func_pmtl_tick:"cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_tick",\
func_pmtl_use_ability:"cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab_ex:classes/cloudbreaker/pmt_cloudbreaker_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_cts_tick",\
func_pmt_score_kill:"cashgrab:util/noop",\
}

scoreboard objectives add evc_torchflower_seeds minecraft.used:minecraft.torchflower_seeds

# Battlesmith
data modify storage cashgrab:game_info classes append value {\
format:1,\
s_class_name:"Battlesmith",\
func_pmt_init:"cashgrab_ex:classes/battlesmith/pmt_battlesmith_init",\
func_pmt_inv:"cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv",\
func_pmt_inv_ability_icon:"cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_ability_icon",\
func_pmtl_tick:"cashgrab_ex:classes/battlesmith/pmtl_battlesmith_tick",\
func_pmtl_use_ability:"cashgrab_ex:classes/battlesmith/pmtl_battlesmith_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab_ex:classes/battlesmith/pmt_battlesmith_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
func_pmt_score_kill:"cashgrab:util/noop",\
}

# Stargazer
data modify storage cashgrab:game_info classes append value {\
format:1,\
s_class_name:"Stargazer",\
func_pmt_init:"cashgrab_ex:classes/stargazer/pmt_stargazer_init",\
func_pmt_inv:"cashgrab_ex:classes/stargazer/pmt_stargazer_inv",\
func_pmt_inv_ability_icon:"cashgrab_ex:classes/stargazer/pmt_stargazer_inv_ability_icon",\
func_pmtl_tick:"cashgrab_ex:classes/stargazer/pmtl_stargazer_tick",\
func_pmtl_use_ability:"cashgrab_ex:classes/stargazer/pmtl_stargazer_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab_ex:classes/stargazer/pmt_stargazer_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab_ex:classes/stargazer/pmtl_stargazer_cts_tick",\
func_pmt_score_kill:"cashgrab:util/noop",\
}

scoreboard objectives add evc_vex_armor_trim_smithing_templates minecraft.used:minecraft.vex_armor_trim_smithing_template
scoreboard objectives add evc_wayfinder_armor_trim_smithing_templates minecraft.used:minecraft.wayfinder_armor_trim_smithing_template
scoreboard objectives add evc_spire_armor_trim_smithing_templates minecraft.used:minecraft.spire_armor_trim_smithing_template

# Evincer
data modify storage cashgrab:game_info classes append value {\
format:1,\
s_class_name:"Evincer",\
func_pmt_init:"cashgrab_ex:classes/evincer/pmt_evincer_init",\
func_pmt_inv:"cashgrab_ex:classes/evincer/pmt_evincer_inv",\
func_pmt_inv_ability_icon:"cashgrab_ex:classes/evincer/pmt_evincer_inv_ability_icon",\
func_pmtl_tick:"cashgrab_ex:classes/evincer/pmtl_evincer_tick",\
func_pmtl_use_ability:"cashgrab_ex:classes/evincer/pmtl_evincer_use_ability",\
func_pmtl_end:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab_ex:classes/evincer/pmt_evincer_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab_ex:classes/evincer/pmtl_evincer_cts_tick",\
func_pmt_score_kill:"cashgrab:util/noop",\
}

scoreboard objectives add evc_sticks minecraft.used:minecraft.stick

# --- Add Trinket data

# Bandage
data modify storage cashgrab:game_info trinkets append value {\
format:1,\
s_trinket_name:"Bandage",\
func_pmt_init:"cashgrab_ex:trinkets/bandage/pmt_bandage_init",\
func_pmt_inv:"cashgrab_ex:trinkets/bandage/pmt_bandage_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/bandage/pmtl_bandage_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/bandage/pmt_bandage_cts_inv_icon",\
evc_usage_score:"evc_papers",\
}

scoreboard objectives add evc_papers minecraft.used:minecraft.paper

# Accelerator
data modify storage cashgrab:game_info trinkets append value {\
format:1,\
s_trinket_name:"Accelerator",\
func_pmt_init:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_init",\
func_pmt_inv:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/accelerator/pmtl_accelerator_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/accelerator/pmt_accelerator_cts_inv_icon",\
evc_usage_score:"evc_xpbottles",\
}

# Echo Bolt
data modify storage cashgrab:game_info trinkets append value {\
format:1,\
s_trinket_name:"Echo Bolt",\
func_pmt_init:"cashgrab_ex:trinkets/echo_bolt/pmt_echo_bolt_init",\
func_pmt_inv:"cashgrab_ex:trinkets/echo_bolt/pmt_echo_bolt_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/echo_bolt/pmtl_echo_bolt_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/echo_bolt/pmt_echo_bolt_cts_inv_icon",\
evc_usage_score:"evc_echo_shards",\
}

scoreboard objectives add evc_echo_shards minecraft.used:minecraft.echo_shard

# Spring Plume
data modify storage cashgrab:game_info trinkets append value {\
format:1,\
s_trinket_name:"Spring Plume",\
func_pmt_init:"cashgrab_ex:trinkets/spring_plume/pmt_spring_plume_init",\
func_pmt_inv:"cashgrab_ex:trinkets/spring_plume/pmt_spring_plume_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/spring_plume/pmtl_spring_plume_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/spring_plume/pmt_spring_plume_cts_inv_icon",\
evc_usage_score:"evc_feathers",\
}

scoreboard objectives add evc_feathers minecraft.used:minecraft.feather

# Hedge Seed
data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Hedge Seed",\
func_pmt_init:"cashgrab_ex:trinkets/hedge_seed/pmt_hedge_seed_init",\
func_pmt_inv:"cashgrab_ex:trinkets/hedge_seed/pmt_hedge_seed_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/hedge_seed/pmtl_hedge_seed_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/hedge_seed/pmt_hedge_seed_cts_inv_icon",\
evc_usage_score:"evc_mangrove_leaves",\
}

scoreboard objectives add evc_mangrove_leaves minecraft.used:minecraft.mangrove_leaves

# Risk-It Biscuit
data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Risk-It Biscuit",\
func_pmt_init:"cashgrab_ex:trinkets/risk_it_biscuit/pmt_risk_it_biscuit_init",\
func_pmt_inv:"cashgrab_ex:trinkets/risk_it_biscuit/pmt_risk_it_biscuit_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/risk_it_biscuit/pmtl_risk_it_biscuit_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/risk_it_biscuit/pmt_risk_it_biscuit_cts_inv_icon",\
evc_usage_score:"evc_clay_balls",\
}

scoreboard objectives add evc_clay_balls minecraft.used:minecraft.clay_ball

# Nox Bomb
data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Nox Bomb",\
func_pmt_init:"cashgrab_ex:trinkets/nox_bomb/pmt_nox_bomb_init",\
func_pmt_inv:"cashgrab_ex:trinkets/nox_bomb/pmt_nox_bomb_inv",\
func_pmtl_use_item:"cashgrab_ex:trinkets/nox_bomb/pmtl_nox_bomb_use_item",\
func_pmt_cts_icon:"cashgrab_ex:trinkets/nox_bomb/pmt_nox_bomb_cts_inv_icon",\
evc_usage_score:"evc_lime_dyes",\
}

scoreboard objectives add evc_lime_dyes minecraft.used:minecraft.lime_dye
