# find the matching ui with player score
scoreboard players operation #search ui.id = @s ui.id
# clear the ui that is closing
execute as @e[type=chest_minecart,tag=ui] if score @s ui.id = #search ui.id run data remove entity @s Items
# kill the ui
execute as @e[tag=ui] if score @s ui.id = #search ui.id run kill @s
# reset the player's score
scoreboard players reset @s ui.id