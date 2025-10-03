# Arguments: contents of cgada:long_csv

$tellraw @s {color:"aqua",text:"[Copy to Clipboard (idx $(temp_i_idx))]",click_event: {action:"copy_to_clipboard",value:"Index,Class,Trinket,Map,Game ID,Kills,Coins,Completed;$(s_data)"}}
