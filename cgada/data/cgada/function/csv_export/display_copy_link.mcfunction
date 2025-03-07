# Arguments: contents of cgada:csv

$tellraw @s {"color":"aqua","text":"[Copy to Clipboard]","clickEvent": {"action":"copy_to_clipboard","value":"$(s_category_headers)\n$(s_column_headers)\n$(s_data)"}}
