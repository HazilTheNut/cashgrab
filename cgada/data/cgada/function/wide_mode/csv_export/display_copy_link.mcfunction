# Arguments: contents of cgada:csv

$tellraw @s {color:"aqua",text:"[Copy to Clipboard]",click_event: {action:"copy_to_clipboard",value:"$(s_category_headers);$(s_column_headers);$(s_data)"}}
