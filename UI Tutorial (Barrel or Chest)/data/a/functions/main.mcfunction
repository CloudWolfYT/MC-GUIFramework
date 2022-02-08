execute as @a[scores={open_ui=1..}] at @s run function a:ui/find/start

scoreboard players set .kill ui 0
execute as @e[type=marker,tag=ui.active] at @s run function a:ui/main
execute if score .kill ui matches 1 run kill @e[type=item,nbt={Item:{tag:{ui:{null:1b}}}}]