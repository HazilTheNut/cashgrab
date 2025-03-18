# tutorial/trainee/pmt_trainee_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches 2.. run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:slime_ball[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Blink\"}]",\
minecraft:lore=[\
"{\"color\":\"blue\",\"italic\":true,\"text\":\"Toss your weapon to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Teleports forwards.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"5\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"],\
] $(charges)
