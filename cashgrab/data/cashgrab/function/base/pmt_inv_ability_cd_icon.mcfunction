# base/pmt_inv_ability_cd_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	cd_secs		: Cooldown remaining, in seconds

$execute if entity @a[tag=t_pm_owner,scores={ability_cd_display_secs=1..}] run item replace entity @a[tag=t_pm_owner] hotbar.4 with minecraft:black_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"gray\",\"text\":\"Ability on Cooldown\"}"] $(cd_secs)
