# classes/mapmaker/pmt_mapmaker_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Mapmaker class for the command executor
#
# Arguments: (none)

# Armor
item replace entity @a[tag=t_pm_owner] armor.head with minecraft:air
item replace entity @a[tag=t_pm_owner] armor.chest with minecraft:air
item replace entity @a[tag=t_pm_owner] armor.legs with minecraft:air
item replace entity @a[tag=t_pm_owner] armor.feet with minecraft:air

# Hotbar
item replace entity @a[tag=t_pm_owner] hotbar.0 with minecraft:brush[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Smoothing Tool\"}"]
item replace entity @a[tag=t_pm_owner] hotbar.1 with minecraft:grass_block[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Topsoil Tool\"}"]
item replace entity @a[tag=t_pm_owner] hotbar.2 with minecraft:map[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Shoot Fireball (strong)\"}"]
item replace entity @a[tag=t_pm_owner] hotbar.3 with minecraft:map[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Shoot Fireball (weak)\"}"]
item replace entity @a[tag=t_pm_owner] hotbar.5 with minecraft:map[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Update Lighting\"}"]
item replace entity @a[tag=t_pm_owner] hotbar.6 with minecraft:map[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Lock Blocks\"}"]
