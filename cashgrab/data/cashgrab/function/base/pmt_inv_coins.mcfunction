# base/pe_display_coins.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Populates coin display in hotbar
#
# Arguments:
#	coins_ones		: Number of coins in the ones place
#	coins_tens		: Number of coins in the tens place

clear @a[tag=t_pm_owner] minecraft:gold_nugget

# Tens place
$execute if entity @a[tag=t_pm_owner,scores={__coins_disp_tens=..0}] run item replace entity @a[tag=t_pm_owner] hotbar.7 with minecraft:gray_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"yellow\",\"text\":\"-\"}"] $(coins_tens)

$execute if entity @a[tag=t_pm_owner,scores={__coins_disp_tens=1..}] run item replace entity @a[tag=t_pm_owner] hotbar.7 with minecraft:gold_ingot[\
minecraft:item_name="{\"italic\":false,\"color\":\"yellow\",\"text\":\"Coins (10)\"}"] $(coins_tens)

# Ones place
$execute if entity @a[tag=t_pm_owner,scores={__coins_disp_ones=..0}] run item replace entity @a[tag=t_pm_owner] hotbar.8 with minecraft:gray_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"yellow\",\"text\":\"-\"}"] $(coins_ones)

$execute if entity @a[tag=t_pm_owner,scores={__coins_disp_ones=1..}] run item replace entity @a[tag=t_pm_owner] hotbar.8 with minecraft:gold_nugget[\
minecraft:item_name="{\"italic\":false,\"color\":\"yellow\",\"text\":\"Coins (1)\"}"] $(coins_ones)
