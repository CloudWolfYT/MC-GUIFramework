# remove ui element items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]

# future proofing, specifies it is a chest minecart
scoreboard players set .type ui 1

# Detect player putting items into the UI
data modify storage ui in set from storage ui current
data remove storage ui in[{components:{"minecraft:custom_data":{ui_item:{}}}}]
execute if data storage ui in[0] run return run function ui:menu/on_input

# Using the insert trick to overwrite slots which have been changed.
data modify storage ui temp set from storage ui previous
data modify storage ui temp[].components."minecraft:custom_data" merge value {prev:1b}
data modify entity @s Items insert 0 from storage ui temp[]
data remove storage ui temp
data modify storage ui temp append from entity @s Items[{components:{"minecraft:custom_data":{prev:1b}}}]
data remove storage ui in
data modify storage ui in append from storage ui temp[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# bandage to prevent blank spots from clicking
execute if data storage ui in[0].components."minecraft:custom_data".ui_item.empty run data remove storage ui in[0]
execute if data storage ui in[0] unless data storage ui in[1] run return run function ui:menu/on_click

# Update Page & History if nothing happened
function ui:menu/refresh