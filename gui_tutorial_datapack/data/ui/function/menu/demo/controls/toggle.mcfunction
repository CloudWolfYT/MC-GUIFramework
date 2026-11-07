# Runs as chest_minecart
execute on passengers store result score #toggle ui run data get entity @s data.values.toggle
scoreboard players add #toggle ui 1
execute if score #toggle ui matches 2.. run scoreboard players set #toggle ui 0
execute on passengers store result entity @s data.values.toggle byte 1 run scoreboard players get #toggle ui

function ui:menu/demo/controls/mask
data modify storage ui current set from storage ui mask
function ui:minecart/load_page
