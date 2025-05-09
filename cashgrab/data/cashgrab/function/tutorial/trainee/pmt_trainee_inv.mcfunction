# tutorial/trainee/pmt_trainee_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Trainee class for the command executor
#
# Arguments: (none)

# Progression of Trainee class
#   0   =   Has nothing
#   1   =   Has Trainee selectable in inventory
#   2   =   Has inventory, Toss ability
#   3   =   Has inventory, Toss ability, Crouch ability
#   4   =   Has inventory, Toss ability, Crouch ability, Passive ability
#   5   =   Has inventory, Toss ability, Crouch ability, Passive ability, Trinket

# If during intro, insert item to exit tutorial
item replace entity @a[tag=t_pm_owner,limit=1,scores={__tutorial_seq_idx=1}] hotbar.6 with minecraft:barrier[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use]"},{color:"white",text:" Return"}],\
minecraft:consumable={\
consume_seconds:0f,\
animation:"brush",\
sound:"entity.villager.work_librarian",\
has_consume_particles:false,\
}\
] 1

#   1   =   Has Trainee selectable in inventory
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches 1 run item replace entity @a[tag=t_pm_owner,limit=1] inventory.13 with minecraft:wooden_sword[\
minecraft:item_name=[{color:"dark_aqua",italic:false,text:"<Class>"},{color:"white",text:" Trainee"}],\
minecraft:custom_data={is_cts_icon:1},\
minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]},\
minecraft:attribute_modifiers=[],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Demonstration class"},\
{color:"dark_gray",italic:true,text:" for the tutorial."},\
]] 1

#   2   =   Has inventory, Toss ability
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches 2.. run function cashgrab:tutorial/trainee/pmt_trainee_inv_equipment

#   3   =   Has inventory, Toss ability, Crouch ability
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches 3.. run function cashgrab:tutorial/trainee/pmt_trainee_inv_climbing_energy {count:25}

#   4   =   Has inventory, Toss ability, Crouch ability, Passive ability
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches 4.. run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.6 with minecraft:clay_ball[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"[Passive]"},{color:"white",text:" Cool Rock"}],\
minecraft:lore=[\
{color:"gray",italic:false,text:"Perhaps the real abilities"},\
{color:"gray",italic:false,text:" were the friends we made"},\
{color:"gray",italic:false,text:" along the way."},\
]] 1
