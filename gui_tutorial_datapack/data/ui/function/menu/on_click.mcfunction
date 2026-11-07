# Run the command stored in the clicked button's custom_data
function ui:run_cmd with storage ui in[0].components."minecraft:custom_data".ui_item

# Reload the (possibly changed) page
execute if score .type ui matches 1 run function ui:minecart/load_page
