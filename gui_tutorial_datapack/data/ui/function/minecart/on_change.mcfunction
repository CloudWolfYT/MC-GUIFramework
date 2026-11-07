# Multiplayer-safe: clear UI button items only from the owner of THIS minecart
scoreboard players operation #search ui.id = @s ui.id
execute as @a if score @s ui.id = #search ui.id run clear @s *[minecraft:custom_data~{ui_item:{}}]


# Mark this as chest-minecart UI
scoreboard players set .type ui 1

# Detect items the player put INTO the UI (non-ui_item items)
data modify storage ui in set from storage ui current
data remove storage ui in[{components:{"minecraft:custom_data":{ui_item:{}}}}]
execute if data storage ui in[0] run return run function ui:menu/on_input

# Detect clicks on UI buttons using the insert-trick
data modify storage ui temp set from storage ui previous
data modify storage ui temp[].components."minecraft:custom_data" merge value {prev:1b}
data modify entity @s Items insert 0 from storage ui temp[]
data remove storage ui temp
data modify storage ui temp append from entity @s Items[{components:{"minecraft:custom_data":{prev:1b}}}]
data remove storage ui in
data modify storage ui in append from storage ui temp[{components:{"minecraft:custom_data":{ui_item:{}}}}]

# Ignore empty "filler" slots
execute if data storage ui in[0].components."minecraft:custom_data".ui_item.empty run data remove storage ui in[0]

# Single button click
execute if data storage ui in[0] unless data storage ui in[1] run return run function ui:menu/on_click

# Nothing meaningful happened -> refresh the page
function ui:menu/refresh
