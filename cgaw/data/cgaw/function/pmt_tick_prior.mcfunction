
# --- Lobby map selection input

# Enable map id selection when game is inactive
execute if score NUM_GAMESTATE num matches 0 run scoreboard players enable @a[tag=t_pm_owner,limit=1] cgaw_selected_map_id_input

# Disable map id selection when playing game