tag @s add this
scoreboard players operation .in ui.id = @s ui.id
execute as @e[type=marker,tag=ui] if score @s ui.id = .in ui.id at @s run function a:ui/return/exit_ui1
execute positioned 0 -64 0 run function a:ui/return/start
tag @s remove this