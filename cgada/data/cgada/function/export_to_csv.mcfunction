
execute if score NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_WIDE num run function cgada:wide_mode/export_to_csv
execute if score NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_LONG num run function cgada:long_mode/export_to_csv