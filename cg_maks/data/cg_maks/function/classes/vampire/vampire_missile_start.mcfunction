# classes/vampire/vampire_missile_start.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vampire's Soul Siphon missile start function, responsible for spawning bats.
#
# Arguments: (none)

# Initialize bat
summon minecraft:bat ~ ~ ~ {Tags:["t_bat_init"]} 

# Give the bat a valid EID (and an EID state of 1 to ensure no collisions)
execute as @e[tag=t_bat_init] run function cashgrab:util/npe_eid_acquire

# Set the owner of this bat to this missile and have this missile grab the bat.
scoreboard players operation @n[tag=t_bat_init] eid_owner = @s eid_self
scoreboard players operation @n[tag=t_bat_init] eid_grabbed_by = @s eid_self

# Set up proper tags.
tag @n[tag=t_bat_init] add t_soul_siphon_bat
tag @n[tag=t_bat_init] add t_no_self_cleanup
tag @n[tag=t_bat_init] remove t_bat_init