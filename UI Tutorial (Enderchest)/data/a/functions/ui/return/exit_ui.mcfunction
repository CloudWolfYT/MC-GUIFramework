tag @s add this

scoreboard players operation .in ui.id = @s ui.id
execute as @e[type=marker,tag=ui] if score @s ui.id = .in ui.id at @s run scoreboard players set @s ui.page 0

data modify storage ui return set from entity @s EnderItems
data remove storage ui return[{tag:{ui:{null:1b}}}]
function a:ui/clear

execute positioned 0 -64 0 run function a:ui/return/start
tag @s remove this

function a:ui/unload