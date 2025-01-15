# trinkets/hedge_seed/npe_hedge_seed_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Hedge Seed missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called 

# Check end reason
$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

function cashgrab_ex:trinkets/hedge_seed/npe_place_hedge_timer

# Initialize collsiion detection for landcrawl
data merge storage cashgrab_ex:hedge_args {data:{col_terrain_allowed:"minecraft:air",delta_x:0.0f,delta_y:0.0f,delta_z:0.0f}}

# --- 90 degree clockwise turned landcrawl

# Set recursion loop count
scoreboard players set @s tv_A 7

# Calculate facing vector
execute rotated ~90 0 run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0}
execute store result storage cashgrab_ex:hedge_args data.delta_x float 0.001 run scoreboard players get @s facing_vector_x_mm
execute store result storage cashgrab_ex:hedge_args data.delta_z float 0.001 run scoreboard players get @s facing_vector_z_mm

# Crawl along ground in one direction to the side
execute rotated ~90 0 run function cashgrab_ex:trinkets/hedge_seed/npe_hedge_landcrawl

# --- 90 degree counter-clockwise turned landcrawl

# Set recursion loop count
scoreboard players set @s tv_A 7

# Calculate facing vector
execute rotated ~-90 0 run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0}
execute store result storage cashgrab_ex:hedge_args data.delta_x float 0.001 run scoreboard players get @s facing_vector_x_mm
execute store result storage cashgrab_ex:hedge_args data.delta_z float 0.001 run scoreboard players get @s facing_vector_z_mm

# Crawl along ground in one direction to the side
execute rotated ~-90 0 run function cashgrab_ex:trinkets/hedge_seed/npe_hedge_landcrawl
