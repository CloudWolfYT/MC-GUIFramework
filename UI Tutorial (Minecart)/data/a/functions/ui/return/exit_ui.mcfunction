tag @s add this
scoreboard players operation .in ui.id = @s ui.id
execute as @e[type=chest_minecart,tag=ui] if score @s ui.id = .in ui.id run function a:ui/return/exit_ui1
execute as @e[type=marker,tag=ui] if score @s ui.id = .in ui.id run kill @s
execute positioned 0 -64 0 run function a:ui/return/start
tag @s remove this