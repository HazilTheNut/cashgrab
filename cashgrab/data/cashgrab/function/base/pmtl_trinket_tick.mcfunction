# base/pmtl_trinket_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Branching tick function for equipped trinket
#
# Arguments:
#	func_pmtl_use_item	: Function to run when the trinket item is used
#	evc_usage_score		: Scoreboard objective that tracks if trinket is used

# If max trinket count is 0, act as the trinket is disabled
execute if score @a[tag=t_pm_owner,limit=1] trinket_charges_max matches ..0 run return 0

# If trinket count is being modified, modify charge count
execute unless entity @a[tag=t_pm_owner,limit=1,scores={trinket_charges_modify=0}] run function cashgrab:base/pmtl_trinket_modify
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_modify 0

# If trinket has being replenished, reset charge count to max
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_trinket_replenish] run function cashgrab:base/pmtl_trinket_replenish
tag @a[tag=t_pm_owner,limit=1,tag=t_trinket_replenish] remove t_trinket_replenish

# If trinket has being revoked, set charge count to 0
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_trinket_revoke] run function cashgrab:base/pmtl_trinket_revoke
tag @a[tag=t_pm_owner,limit=1,tag=t_trinket_revoke] remove t_trinket_revoke

# Track whether trinket is in offhand
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 0
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 1

# Get trinket quantity in inventory and store into trinket_charges
function cashgrab:base/pmt_trinket_count

#$execute if score @a[tag=t_pm_owner,limit=1] $(evc_usage_score) matches 1.. run tellraw @a[tag=t_pm_owner,limit=1,tag=t_debug] [{"type":"text","text":"base/pmtl_trinket_tick: evc_usage_score: $(evc_usage_score) value = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"$(evc_usage_score)"}}]
#$execute if score @a[tag=t_pm_owner,limit=1] $(evc_usage_score) matches 1.. run tellraw @a[tag=t_pm_owner,limit=1,tag=t_debug] [{"type":"text","text":"base/pmtl_trinket_tick: trinket_charges = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"trinket_charges"}}]
#$execute if score @a[tag=t_pm_owner,limit=1] $(evc_usage_score) matches 1.. run tellraw @a[tag=t_pm_owner,limit=1,tag=t_debug] [{"type":"text","text":"base/pmtl_trinket_tick: __trinket_charges_prev = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"__trinket_charges_prev"}}]

# If current charge count changed and evc_usage_score did not occur, revert trinket to previous state
$execute if score @a[tag=t_pm_owner,limit=1] $(evc_usage_score) matches 0 unless score @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run function cashgrab:base/pmt_trinket_revert

# If evc_usage_score did not occur, store current into previous then do not run below
$execute if score @a[tag=t_pm_owner,limit=1] $(evc_usage_score) matches 0 run scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges
$execute if score @a[tag=t_pm_owner,limit=1] $(evc_usage_score) matches 0 run return 0

$tellraw @a[tag=t_pm_owner,limit=1,tag=t_debug] "evc_usage_score ($(evc_usage_score)) passed; func_pmtl_use_item = $(func_pmtl_use_item)"

# If current charge count is less than previous and evc_usage_score occurred, run trinket usage code and consume event
$execute if score @a[tag=t_pm_owner,limit=1] trinket_charges < @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run function $(func_pmtl_use_item)
$execute if score @a[tag=t_pm_owner,limit=1] trinket_charges < @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run scoreboard players set @a[tag=t_pm_owner,limit=1] $(evc_usage_score) 0

# If current charge count changed, reload display for trinket
execute unless score @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run function cashgrab:util/pmt_inv_trinket_argloader

# Store current into previous
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges
