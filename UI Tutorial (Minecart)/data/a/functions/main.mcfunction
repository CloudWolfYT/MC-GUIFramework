## spawn ui container if holding correct item
execute as @a[scores={ui.id=0},nbt={SelectedItem:{tag:{ui:1b}}}] at @s run function a:ui/spawn
execute as @a[scores={ui.id=1..}] unless data entity @s SelectedItem.tag.ui run function a:ui/close

scoreboard players set .kill ui 0
execute as @e[type=marker,tag=ui] at @s run function a:ui/main
execute if score .kill ui matches 1 run kill @e[type=item,nbt={Item:{tag:{ui:{null:1b}}}}]

execute as @e[type=#a:minecarts,tag=!invisible_minecart] run function a:invisible_minecarts