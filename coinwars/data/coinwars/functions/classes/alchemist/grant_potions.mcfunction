# classes/alchemist/grant_potions.mcfunction
#
# Context:
#	as: an entity with class = 9
#	at: the entity
#
# Summary: Grants potions to command executor based on what they should have
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Caustic Brew
execute if score @s cv_A matches 1.. run item replace entity @s hotbar.1 with minecraft:splash_potion[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Caustic Brew\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:potion_contents={custom_color:7206301,custom_effects:[\
{id:"minecraft:poison",amplifier:0,duration:100},\
{id:"minecraft:slowness",amplifier:0,duration:100},\
{id:"minecraft:mining_fatigue",amplifier:1,duration:100},\
]}]

# Booster Brew
execute if score @s cv_B matches 1.. run item replace entity @s hotbar.2 with minecraft:potion[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Booster Brew\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:potion_contents={custom_color:15758261,custom_effects:[\
{id:"minecraft:regeneration",amplifier:2,duration:120},\
{id:"minecraft:resistance",amplifier:0,duration:120},\
{id:"minecraft:speed",amplifier:1,duration:120},\
]}]
