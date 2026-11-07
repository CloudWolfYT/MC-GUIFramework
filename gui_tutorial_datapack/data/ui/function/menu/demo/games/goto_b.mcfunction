scoreboard players operation #search ui.id = @s ui.id
execute as @a if score @s ui.id = #search ui.id run tag @s add ui_target
execute as @a[tag=ui_target] run function ui:player/close
execute as @a[tag=ui_target] run tp @s -59.0 56 -5.0
tag @a[tag=ui_target] remove ui_target
