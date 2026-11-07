# Runs as chest_minecart
execute on passengers store result score #count ui run data get entity @s data.values.count
scoreboard players add #count ui 1
execute if score #count ui matches 11.. run scoreboard players set #count ui 10
execute on passengers store result entity @s data.values.count int 1 run scoreboard players get #count ui

function ui:menu/demo/controls/mask
data modify storage ui current set from storage ui mask
function ui:minecart/load_page
