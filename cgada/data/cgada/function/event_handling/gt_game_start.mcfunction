
# Record number of games played
execute store result score CGADA_NUM num run data get storage cgada:generic_data i_games_played 1
execute store result storage cgada:generic_data i_games_played int 1 run scoreboard players add CGADA_NUM num 1
