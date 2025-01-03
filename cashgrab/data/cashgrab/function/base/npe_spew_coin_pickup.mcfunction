# base/npe_spew_coin_pickup.mcfunction
#
# Context: 
#	as: a player
#	at: the entity
#
# Summary: Dispenses a coin
#
# Arguments:
#	vx	: x velocity of the coin
#	vz	: z velocity of the coin

$summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b,components:{"minecraft:item_name":"Coin"}},\
Motion:[$(vx)d,0.75d,$(vz)d],\
Tags:["t_pickup","t_coin_particles"],\
PickupDelay:40s}

particle minecraft:block{block_state:{Name:"minecraft:gold_block"}} ~ ~ ~ 0.05 0.05 0.05 1 3
particle minecraft:dust{color:[0.9f,0.9f,0.65f],scale:1.0} ~ ~ ~ 0.5 0.5 0.5 0 10

#execute if entity @s[tag=!t_stasis] run playsound minecraft:entity.experience_orb.pickup block @a ~ ~ ~ 0.7 1.25
playsound minecraft:entity.experience_orb.pickup block @a ~ ~ ~ 0.7 1.25
