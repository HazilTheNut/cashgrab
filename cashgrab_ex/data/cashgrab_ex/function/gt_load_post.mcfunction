
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
