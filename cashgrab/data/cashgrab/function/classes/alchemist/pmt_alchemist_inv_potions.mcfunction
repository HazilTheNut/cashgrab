# classes/alchemist/grant_potions.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
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
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.1 with minecraft:splash_potion[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Caustic Fume\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:potion_contents={custom_color:7206301,custom_effects:[\
{id:"minecraft:poison",amplifier:0,duration:140},\
{id:"minecraft:slowness",amplifier:0,duration:140},\
{id:"minecraft:mining_fatigue",amplifier:4,duration:140},\
]}]

# Booster Brew
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.2 with minecraft:potion[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Booster Brew\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:potion_contents={custom_color:15108608,custom_effects:[\
{id:"minecraft:resistance",amplifier:0,duration:160},\
{id:"minecraft:strength",amplifier:0,duration:160},\
]}]