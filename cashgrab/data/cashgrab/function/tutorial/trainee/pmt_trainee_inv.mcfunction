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
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Return\"}]",\
minecraft:consumable={\
consume_seconds:0f,\
animation:"brush",\
has_consume_particles:false,\
}\
] 1

