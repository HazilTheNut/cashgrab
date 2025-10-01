
#$tellraw @a "Writing $(s_temp_class_name),$(i_temp_class_entries),$(i_temp_class_coins),$(i_temp_class_kills),$(i_temp_class_deaths)$(s_data_trinket_entries)$(s_data_trinket_coins)"

$data modify storage cgada:csv s_data set value "$(s_data)$(s_temp_class_name),$(i_temp_class_entries),$(i_temp_class_coins),$(i_temp_class_kills),$(i_temp_class_deaths)$(s_data_trinket_entries)$(s_data_trinket_coins);"
